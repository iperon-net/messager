part of 'debug_cubit.dart';

@freezed
class DebugState with _$DebugState {
  const factory DebugState.initial({
    required int counter,
  }) = _Initial;

}
