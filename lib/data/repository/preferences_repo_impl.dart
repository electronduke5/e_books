import 'package:flutter/src/material/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/preferences_repository.dart';
import '../../presentation/di/app_module.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  @override
  Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print('token in prefs_repo_impl: $token');

    if (token == null) return null;
    final auth = AppModule.getAuthRepository();
    final user = await auth.signInByToken(token);
    AppModule.getProfileHolder().user = user;
    return user.name;
  }

  @override
  Future<ThemeMode> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('theme')) return ThemeMode.system;
    return ThemeMode.values[prefs.getInt('theme')!];
  }

  @override
  Future<void> removeSavedProfile() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  @override
  Future<void> saveProfile(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  @override
  Future<void> saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', themeMode.index);
  }
}
