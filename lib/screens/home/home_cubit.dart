import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants.dart';
import '../../di.dart';
import '../../logger.dart';
import '../../services/services.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  final logger = getIt.get<Logger>();
  final services = getIt.get<Services>();

  Future<void> startup() async {
    emit(state.copyWith(statusState: StatusState.loading));

    final user = await services.users.getActive();
    logger.debug(user.toString());
    logger.debug("startup");

    emit(state.copyWith(statusState: StatusState.success));
  }

}
