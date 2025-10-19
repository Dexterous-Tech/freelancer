import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freelancer/core/shared/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static final flutterSecureStorage = FlutterSecureStorage();

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    debugPrint(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String> getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> deleteSecuredString(String key) async {
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    await flutterSecureStorage.delete(key: key);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);

    return value;
  }

  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> clearAllKeys() async {
    // final prefs = await SharedPreferences.getInstance();
    Future.wait([
      flutterSecureStorage.delete(key: SharedPreferencesKey.apiTokenKey),
      flutterSecureStorage.delete(key: SharedPreferencesKey.deviceToken),
    ]);
  }
}
