import 'package:flutter/src/material/app.dart';
import 'package:loan_calculator/src/data/datasources/local/theme/theme_local_data_source.dart';
import 'package:loan_calculator/src/domain/repositories/theme/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl(this._themeLocalDataSource);

  final ThemeLocalDataSource _themeLocalDataSource;

  @override
  ThemeMode getTheme() => _themeLocalDataSource.getTheme();

  @override
  Future<void> saveTheme(ThemeMode themeMode) =>
      _themeLocalDataSource.saveTheme(themeMode);
}
