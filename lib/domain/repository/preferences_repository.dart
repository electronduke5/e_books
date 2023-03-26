import 'package:flutter/material.dart';

abstract class PreferencesRepository {
  Future<String?> getUser();

  Future<void> saveProfile(String token);

  Future<void> saveTheme(ThemeMode themeMode);

  Future<ThemeMode> loadThemeMode();

  Future<void> removeSavedProfile();
}
