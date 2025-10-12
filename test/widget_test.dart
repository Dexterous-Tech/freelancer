// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:freelancer/core/di/injection_container.dart';
import 'package:freelancer/main.dart';

void main() {
  setUpAll(() async {
    // Register all GetIt dependencies
    await initializeDependencies();
    await sl.allReady();
  });

  tearDownAll(() async {
    // Clean up GetIt after tests
    await sl.reset();
  });

  testWidgets('Test Freelancer main', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(FreeLancerApp());

    // Wait for initial frame
    await tester.pump();

    // Fast-forward time by 3 seconds
    await tester.pump(const Duration(seconds: 4));
  });
}
