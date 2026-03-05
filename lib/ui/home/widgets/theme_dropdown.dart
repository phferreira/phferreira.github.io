import 'package:flutter/material.dart';
import 'package:phferreira/core/theme/app_theme.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({
    super.key,
    required this.currentThemeMode,
    required this.onThemeChanged,
    required this.compact,
  });

  final AppThemeMode currentThemeMode;
  final ValueChanged<AppThemeMode> onThemeChanged;
  final bool compact;

  String _themeLabel(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.custom:
        return 'Custom';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: compact ? 50 : 180,
      child: DropdownButtonFormField<AppThemeMode>(
        value: currentThemeMode,
        alignment:
            compact ? Alignment.center : AlignmentDirectional.centerStart,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          isDense: true,
          contentPadding: compact
              ? const EdgeInsets.symmetric(vertical: 10)
              : const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        ),
        icon: const Icon(Icons.palette_outlined),
        onChanged: (mode) {
          if (mode != null) {
            onThemeChanged(mode);
          }
        },
        selectedItemBuilder: (context) {
          return AppThemeMode.values
              .map(
                (theme) => Align(
                  alignment: compact ? Alignment.center : Alignment.centerLeft,
                  child: compact ? const Text('') : Text(_themeLabel(theme)),
                ),
              )
              .toList();
        },
        items: AppThemeMode.values
            .map(
              (theme) => DropdownMenuItem(
                value: theme,
                child: Text(_themeLabel(theme)),
              ),
            )
            .toList(),
      ),
    );
  }
}
