import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phferreira/core/theme/app_theme.dart';
import 'package:phferreira/ui/home/widgets/theme_dropdown.dart';

void main() {
  testWidgets('ThemeDropdown exibe opções e dispara callback', (tester) async {
    AppThemeMode? selectedMode;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ThemeDropdown(
            currentThemeMode: AppThemeMode.light,
            onThemeChanged: (mode) => selectedMode = mode,
            compact: false,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButtonFormField<AppThemeMode>));
    await tester.pumpAndSettle();

    expect(find.text('Dark'), findsOneWidget);

    await tester.tap(find.text('Dark').last);
    await tester.pumpAndSettle();

    expect(selectedMode, AppThemeMode.dark);
  });
}
