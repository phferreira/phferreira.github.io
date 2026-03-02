import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:phferreira/core/theme/app_theme.dart';
import 'package:phferreira/ui/home/home_page.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());

  runApp(
    MaterialApp(
      title: 'phferreira',
      theme: AppTheme.theme,
      home: const HomePage(),
    ),
  );
}
