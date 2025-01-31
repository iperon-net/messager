import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/models/profiles.dart';
import 'package:messenger/models/users.dart';

void main() {
  // print(DateTime(1000000).millisecond);

  final profile = Profile(firstName: "1", dateBirth: DateTime.parse("2012-02-27T14:00:01.5434+03:00"));
  print(profile.dateBirth?.microsecondsSinceEpoch);
  print(profile.toJson());

  // final user = User.db(email: 'kostya@yandex.ru', accessToken: 'accessToken', refreshToken: 'refreshToken', isActive: true);
  // print(user.toJson());


}
