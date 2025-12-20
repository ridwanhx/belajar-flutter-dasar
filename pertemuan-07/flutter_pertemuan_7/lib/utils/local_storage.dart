import 'package:shared_preferences/shared_preferences.dart';

// Implementasi Shared Preferences | REFACTORING
class LocalStorage {
  static const _keyLogin = "isLoggedIn";
  static const _keyEmail = "loggedEmail";

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<void> saveLogin(String email) async {
    final p = await _prefs;
    await p.setBool(_keyLogin, true);
    await p.setString(_keyEmail, email);
  }

  static Future<bool> isLoggedIn() async {
    final p = await _prefs;
    return p.getBool(_keyLogin) ?? false;
  }

  static Future<String?> getEmail() async {
    final p = await _prefs;
    return p.getString(_keyEmail);
  }

  static Future<void> clear() async {
    final p = await _prefs;
    await p.remove(_keyLogin);
    await p.remove(_keyEmail);
  }
}