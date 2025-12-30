import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:rzi_hifdhapp/features/settings/data/models/theme_mode_preference.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final ThemeModePreference preference;

  const ThemeState({required this.themeMode, required this.preference});

  const ThemeState.initial()
    : themeMode = ThemeMode.system,
      preference = ThemeModePreference.auto;

  ThemeState copyWith({ThemeMode? themeMode, ThemeModePreference? preference}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      preference: preference ?? this.preference,
    );
  }

  @override
  List<Object?> get props => [themeMode, preference];
}
