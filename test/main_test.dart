import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phferreira/main.dart';

void main() {
  testWidgets('PortfolioApp renderiza navegação principal', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
  });
}
