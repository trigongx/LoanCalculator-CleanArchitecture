import 'package:flutter/material.dart';
import 'package:loan_calculator/src/core/storage/shared_preferences_service.dart';
import 'package:loan_calculator/src/data/datasources/local/theme/theme_local_data_source.dart';

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  const ThemeLocalDataSourceImpl(this._storage);

  final SharedPreferencesService _storage;
  static const String _themeKey = 'theme_mode';

  @override
  Future<void> saveTheme(ThemeMode themeMode) async {
    await _storage.setString(_themeKey, themeMode.name);
  }

  @override
  ThemeMode getTheme() {
    final value = _storage.getString(_themeKey);

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.light,
    );
  }
}
