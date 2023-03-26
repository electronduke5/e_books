import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._prefs) : super(ThemeMode.system);
  final SharedPreferences _prefs;

  late ThemeMode themeMode = getCurrentTheme;

  void switchTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      saveThemeMode();
      emit(themeMode);
    } else {
      themeMode = ThemeMode.light;
      saveThemeMode();
      emit(themeMode);
    }
  }

  void saveThemeMode() => _prefs.setInt("theme", themeMode.index);

  ThemeMode loadThemeMode() {
    if (_prefs.containsKey('theme')) {
      return ThemeMode.values[_prefs.getInt('theme')!];
    }
    return ThemeMode.system;
  }

  ThemeMode get getCurrentTheme => loadThemeMode();
}
