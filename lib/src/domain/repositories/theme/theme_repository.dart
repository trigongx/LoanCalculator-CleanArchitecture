import 'package:flutter/material.dart';

abstract interface class ThemeRepository {
  Future<void> saveTheme(ThemeMode themeMode);

  ThemeMode getTheme();
}