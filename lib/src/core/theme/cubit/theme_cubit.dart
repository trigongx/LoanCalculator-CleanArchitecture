import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:loan_calculator/src/domain/repositories/theme/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
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

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
