import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/cubit/theme_cubit.dart';
import '../../../domain/repositories/theme/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._themeRepository)
    : super(ThemeState(themeMode: _themeRepository.getTheme()));

  final ThemeRepository _themeRepository;

  Future<void> toggleTheme({required Brightness brightness}) async {
    final themeMode = brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    emit(ThemeState(themeMode: themeMode));

    await _themeRepository.saveTheme(themeMode);
  }
}
