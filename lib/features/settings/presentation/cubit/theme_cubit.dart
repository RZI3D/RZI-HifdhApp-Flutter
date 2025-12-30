import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rzi_hifdhapp/features/settings/data/models/theme_mode_preference.dart';
import 'package:rzi_hifdhapp/features/settings/presentation/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themePreferenceKey = 'theme_preference';
  final SharedPreferencesAsync _prefs;

  ThemeCubit(this._prefs) : super(const ThemeState.initial()) {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    try {
      final preferenceString = await _prefs.getString(_themePreferenceKey);

      if (preferenceString != null) {
        final preference = ThemeModePreferenceExtension.fromJson(
          preferenceString,
        );
        _applyThemePreference(preference);
      }
    } catch (e) {
      // If there's an error loading preferences, use default
      emit(const ThemeState.initial());
    }
  }

  Future<void> setThemePreference(ThemeModePreference preference) async {
    await _prefs.setString(_themePreferenceKey, preference.toJson());
    _applyThemePreference(preference);
  }

  void _applyThemePreference(ThemeModePreference preference) {
    ThemeMode themeMode;

    switch (preference) {
      case ThemeModePreference.light:
        themeMode = ThemeMode.light;
        break;
      case ThemeModePreference.dark:
        themeMode = ThemeMode.dark;
        break;
      case ThemeModePreference.auto:
        // Use system theme
        themeMode = ThemeMode.system;
        break;
    }

    emit(ThemeState(themeMode: themeMode, preference: preference));
  }
}
