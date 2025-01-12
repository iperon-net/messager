import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'debug_state.dart';
part 'debug_cubit.freezed.dart';

@injectable
class DebugCubit extends Cubit<DebugState> {
  DebugCubit() : super(const DebugState.initial(counter: 0));

  void increment(BuildContext context) {
    if(!context.mounted) return;

    if (state.counter >= 5) {
      emit(const DebugState.initial(counter: 0));
      return context.goNamed("logger_monitor");
    }

    emit(DebugState.initial(counter: state.counter + 1));
  }

  void reset() {
    emit(const DebugState.initial(counter: 0));
  }
}
