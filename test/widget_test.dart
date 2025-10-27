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

import 'test_helpers.dart';

void main() {
  setUpAll(() async {
    // Ensure Flutter test binding is ready
    TestWidgetsFlutterBinding.ensureInitialized();

    // Setup all platform plugin mocks
    setupPlatformPluginMocks();

    // Initialize EasyLocalization
    await EasyLocalization.ensureInitialized();

    // Initialize dependencies
    await initializeDependencies();
    await sl.allReady();
  });

  tearDownAll(() async {
    // Clean up dependencies
    await sl.reset();

    // Clear all mock handlers
    clearAllMockMethodCallHandlers();
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

    // Wait for splash screen animations to complete
    // The splash screen has multiple timers: 300ms delay + 300ms navigation delay
    // Plus animation durations: 1200ms + 900ms = 2100ms total
    // So we need at least 2100ms + 300ms + 300ms = 2700ms
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify the app loaded successfully
    expect(find.byType(MaterialApp), findsOneWidget);

    // Ensure all timers are cleared before test ends
    await tester.pumpAndSettle();
  });
}
