import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ceodp_website/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CeodpApp());

    // Verify that the app title and key sections are present.
    expect(find.text('CEODP'), findsWidgets);
    expect(find.text('Control Every Operation of Digital Pay'), findsWidgets);

    // Verify navigation bar items exist (on desktop size)
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);
  });
}
