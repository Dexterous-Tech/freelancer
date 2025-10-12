// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freelancer/core/di/injection_container.dart';
import 'package:freelancer/main.dart';
// adjust path if needed

void main() {
  setUpAll(() async {
    // Ensure Flutter test binding is ready
    TestWidgetsFlutterBinding.ensureInitialized();

    // Initialize dependencies
    await initializeDependencies();
    await sl.allReady();

    // Initialize EasyLocalization (now safe)
    await EasyLocalization.ensureInitialized();
  });

  tearDownAll(() async {
    // Clean up dependencies
    await sl.reset();
  });

  testWidgets('Test Freelancer main', (WidgetTester tester) async {
    // Wrap app with EasyLocalization
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar'), Locale('ur')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const FreeLancerApp(),
      ),
    );

    // Render first frame
    await tester.pump();

    // Simulate splash or loading delay
    await tester.pump(const Duration(seconds: 4));
  });
}
