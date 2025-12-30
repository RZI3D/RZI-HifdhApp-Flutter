import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rzi_hifdhapp/features/settings/data/models/theme_mode_preference.dart';
import 'package:rzi_hifdhapp/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:rzi_hifdhapp/features/settings/presentation/cubit/theme_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Appearance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Theme',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _ThemeOption(
                        title: 'Light',
                        subtitle: 'Use light theme',
                        value: ThemeModePreference.light,
                        groupValue: state.preference,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<ThemeCubit>().setThemePreference(
                              value,
                            );
                          }
                        },
                      ),
                      _ThemeOption(
                        title: 'Dark',
                        subtitle: 'Use dark theme',
                        value: ThemeModePreference.dark,
                        groupValue: state.preference,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<ThemeCubit>().setThemePreference(
                              value,
                            );
                          }
                        },
                      ),
                      _ThemeOption(
                        title: 'Auto',
                        subtitle: 'Follow system theme',
                        value: ThemeModePreference.auto,
                        groupValue: state.preference,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<ThemeCubit>().setThemePreference(
                              value,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final ThemeModePreference value;
  final ThemeModePreference groupValue;
  final ValueChanged<ThemeModePreference?> onChanged;

  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ThemeModePreference>(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
    );
  }
}
