import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../api/api.dart';
import '../../constants.dart';
import '../../alerts.dart';
import '../../crypto.dart';
import '../../di.dart';
import '../../exceptions.dart';
import '../../logger.dart';
import '../../utils.dart';
import '../../protobuf/protos/auth.pb.dart';
import '../../repositories/repositories.dart';
import '../../services/services.dart';

part 'auth_confirmation_state.dart';
part 'auth_confirmation_cubit.freezed.dart';

class AuthConfirmationCubit extends Cubit<AuthConfirmationState> {
  AuthConfirmationCubit() : super(AuthConfirmationState(
    formKey: GlobalKey<FormState>(),
    textControllerCode: TextEditingController(),
    focusNodeCode: FocusNode(),
  ));

  final logger = getIt.get<Logger>();
  final alerts = getIt.get<Alerts>();
  final utils = getIt.get<Utils>();
  final api = getIt.get<API>();
  final crypto = getIt.get<Crypto>();
  final repositories = getIt.get<Repositories>();
  final exceptions = getIt.get<Exceptions>();
  final services = getIt.get<Services>();

  // Validator code
  String? validatorCode(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('invalidConfirmationCode');

    final valueInt = int.parse(value);

    if (valueInt >= 100_000 && valueInt <= 999_999) return null;

    return context.tr('invalidConfirmationCode');
  }

  // Validator
  Future<void> validator(BuildContext context) async {
    if (!state.formKey.currentState!.validate()) return;
    emit(state.copyWith(statusState: StatusState.loading));

    final pathParameters = GoRouterState.of(context).pathParameters;

    // Ecdh
    final keyExchange = await crypto.keyExchangeGenerateKeyPair();

    // Send to API
    late AuthConfirmationResponse confirmationResponse;

    final resultExceptionGrpc = await exceptions.grpc(() async {
      confirmationResponse = await api.auth.confirmation(
        signInToken: pathParameters["signInToken"].toString(),
        code: int.parse(state.textControllerCode.text),
        exchangeKey: keyExchange.publicKey,
      );
    });

    if (resultExceptionGrpc.error.isNotEmpty) {
      emit(state.copyWith(statusState: StatusState.error));
      if (context.mounted) alerts.show(context, Alert(context.tr("error"), context.tr(resultExceptionGrpc.error)));
      return;
    }

    final sharedKey = await crypto.keyExchangeValidate(keyPair: keyExchange.keyPair, remotePublicKey: confirmationResponse.exchangeKey);

    // Save user
    await services.users.createOrUpdate(
      userId: confirmationResponse.userId,
      email: confirmationResponse.email,
      sessionToken: confirmationResponse.sessionToken,
      isActive: 1,
      sharedKey: Uint8List.fromList(sharedKey),
      server: "",
    );

    // logger.debug(confirmationResponse.toDebugString());
    // logger.debug(sharedKey.toString());

    emit(state.copyWith(statusState: StatusState.success));

    logger.debug("Redirect to home");
    if (context.mounted) context.goNamed("home");
  }

}
