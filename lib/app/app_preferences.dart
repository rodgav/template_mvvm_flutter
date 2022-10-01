import 'package:template_mvvm_flutter/presentation/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encrypt_helper.dart';

const String languageKey = 'languageKeyAdmin';
const String prefsKeyToken = 'prefsKeyToken';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  final EncryptHelper _encryptHelper;

  AppPreferences(this._sharedPreferences, this._encryptHelper);

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(languageKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.spanish.getValue();
    }
  }

  void setAppLanguage(String currentLanguage) {
    if (currentLanguage == LanguageType.spanish.getValue()) {
      _sharedPreferences.setString(
          languageKey, LanguageType.spanish.getValue());
    } else {
      _sharedPreferences.setString(
          languageKey, LanguageType.english.getValue());
    }
  }

  Locale getLocale() {
    String curentLanguage = getAppLanguage();
    if (curentLanguage == LanguageType.english.getValue()) {
      return englishLocal;
    } else {
      return spanishLocal;
    }
  }

  Future<void> setToken(String token)async {
    await _sharedPreferences.setString(
        prefsKeyToken, _encryptHelper.encrypt(token) ?? '');
  }

  String getToken() {
    final tokenEncry = _sharedPreferences.getString(prefsKeyToken) ?? '';
    final tokenDecry = _encryptHelper.decrypt(tokenEncry) ?? '';
    return tokenDecry;
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(languageKey);
    await _sharedPreferences.remove(prefsKeyToken);
  }
}
