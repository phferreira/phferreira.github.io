import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:phferreira/core/theme/app_theme.dart';
import 'package:phferreira/ui/home/home_page.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  AppThemeMode _themeMode = AppThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'phferreira',
      theme: AppTheme.byMode(_themeMode),
      home: HomePage(
        currentThemeMode: _themeMode,
        onThemeChanged: (themeMode) {
          setState(() {
            _themeMode = themeMode;
          });
        },
      ),
    );
  }
}
