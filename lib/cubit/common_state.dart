part of 'common_cubit.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState.initial({
    required bool connectivity,
  }) = _Initial;

}
