import 'package:freezed_annotation/freezed_annotation.dart';

class ConverterBoolToInt implements JsonConverter<bool, int?> {
  const ConverterBoolToInt();

  @override
  int toJson(bool val) => val ? 1 : 0;

  @override
  bool fromJson(int? val) => val != null && val > 0 ? true : false;
}
