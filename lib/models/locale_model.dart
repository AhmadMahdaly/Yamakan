import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleModel extends ChangeNotifier {
  LocaleModel(this._prefs) {
    final selectedLocale = _prefs.getString(
      'selectedLocale',
    );
    if (selectedLocale != null) {
      _locale = Locale(
        selectedLocale,
      );
    }
  }
  Locale? _locale;
  final SharedPreferences _prefs;

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    _prefs.setString(
      'selectedLocale',
      locale.toString(),
    );

    notifyListeners();
  }
}
