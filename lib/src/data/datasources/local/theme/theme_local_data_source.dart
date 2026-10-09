import 'package:flutter/material.dart';

abstract interface class ThemeLocalDataSource {
  Future<void> saveTheme(ThemeMode themeMode);

  ThemeMode getTheme();
}