import 'dart:async';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.dart';
import 'logger.dart';

class Storage {
  final logger = getIt.get<Logger>();
  late FlutterSecureStorage storage;
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<void> initialization() async {
    if (Platform.isAndroid) {
      storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    } else {
      storage = FlutterSecureStorage();
    }

    logger.debug("storage initialization");
  }

  Future<void> setSecure({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String> getSecure({required String key}) async {
    final result = await storage.read(key: key);
    if (result != null) return result;
    return "";
  }

  Future<void> deleteSecure({required String key}) async {
    await storage.delete(key: key);
  }

  // SharedPreferencesAsync
  Future<void> setBool({required String key, required bool value}) async {
    await asyncPrefs.setBool(key, value);
  }

  Future<void> setString({required String key, required String value}) async {
    await asyncPrefs.setString(key, value);
  }

  Future<void> setInt({required String key, required int value}) async {
    await asyncPrefs.setInt(key, value);
  }

  Future<void> setStringList({required String key, required List<String> value}) async {
    await asyncPrefs.setStringList(key, value);
  }

  Future<void> remove({required String key}) async {
    await asyncPrefs.remove('counter');
  }
}
