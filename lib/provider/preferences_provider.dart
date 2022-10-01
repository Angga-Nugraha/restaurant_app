import 'package:flutter/material.dart';

import '../common/styles.dart';
import '../data/preference/preference_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyUpdatesActive = false;
  bool get isDailyUpdatesActive => _isDailyUpdatesActive;

  PreferencesHelper preferencesHelper;
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    _getDailyUpdatesPreferences();
  }

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyUpdatesPreferences() async {
    _isDailyUpdatesActive = await preferencesHelper.isDailyUpdatesPreferences;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyUpdates(bool value) {
    preferencesHelper.setDailyUpdates(value);
    _getDailyUpdatesPreferences();
  }
}
