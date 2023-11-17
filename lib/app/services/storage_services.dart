import 'dart:io';
import 'package:macos_ui_app/app/constants/constants.dart';
import 'package:macos_ui_app/app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoregeServices {
  late SharedPreferences _prefs;

  Future<SharedPreferences> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  String? get token {
    return _prefs.getString(kTokenKey);
  }

  String? get iban {
    return _prefs.getString(kUserIban);
  }

  User? get user {
    var data = _prefs.getString(kUserDataKey);

    if (data == null) return null;

    var user = User.fromJson(data);

    if (user.toMap().isEmpty) return null;

    return user;
  }

  bool get isLoggedIn {
    return _prefs.getBool(kUserLoggedInKey) ?? false;
  }

  bool get isDarkMode {
    return _prefs.getBool(kIsDarkModeKey) ?? false;
  }

  String get locale {
    return _prefs.getString(kAppLocale) ?? Platform.localeName.split('_').first;
  }

  Future<void> storeToken(String value) async {
    await _prefs.remove(kTokenKey);
    await _prefs.setString(kTokenKey, value);
  }

  Future<void> storeIban(String iban) {
    return _prefs.setString(
      kUserIban,
      iban,
    );
  }

  Future<void> storeLocale(String locale) {
    return _prefs.setString(
      kAppLocale,
      locale,
    );
  }

  Future<bool> storeUser(User user) async {
    await _prefs.remove(kUserDataKey);
    return await _prefs.setString(
      kUserDataKey,
      user.toJson(),
    );
  }

  Future<bool> storeIsLoggedIn(bool remember) async {
    await _prefs.remove(kUserLoggedInKey);
    return await _prefs.setBool(kUserLoggedInKey, remember);
  }

  Future<bool> saveTheme({required bool darkMode}) async {
    return await _prefs.setBool(kIsDarkModeKey, darkMode);
  }

  Future<bool> eraseStorage() async {
    return await _prefs.clear();
  }
}
