import 'package:freezed_annotation/freezed_annotation.dart';

part 'models_db.freezed.dart';

@freezed
class VersionDB with _$VersionDB {
  const factory VersionDB({
    required String version,
  }) = _VersionDB;
}

