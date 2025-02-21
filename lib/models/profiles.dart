import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiles.freezed.dart';
part 'profiles.g.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  @JsonSerializable(explicitToJson: true)
  const factory Profile({
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @JsonKey(name: 'about') @Default('') String about,
    @JsonKey(name: 'date_birth') DateTime? dateBirth,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) => _$ProfileFromJson(json);
}
