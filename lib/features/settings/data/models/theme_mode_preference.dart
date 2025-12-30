enum ThemeModePreference {
  light,
  dark,
  auto,
}

extension ThemeModePreferenceExtension on ThemeModePreference {
  String toJson() {
    switch (this) {
      case ThemeModePreference.light:
        return 'light';
      case ThemeModePreference.dark:
        return 'dark';
      case ThemeModePreference.auto:
        return 'auto';
    }
  }

  static ThemeModePreference fromJson(String json) {
    switch (json) {
      case 'light':
        return ThemeModePreference.light;
      case 'dark':
        return ThemeModePreference.dark;
      case 'auto':
        return ThemeModePreference.auto;
      default:
        return ThemeModePreference.auto;
    }
  }
}
