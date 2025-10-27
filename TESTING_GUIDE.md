# Testing Guide

## Overview

This guide explains how testing is configured in the Freelancer app and how to handle platform-specific plugins in tests.

## The Problem

When running `flutter test` in CI/CD or locally, you may encounter `MissingPluginException` errors for platform-specific plugins like:

- `flutter_secure_storage`
- `firebase_core`
- `firebase_auth`
- `firebase_messaging`

This happens because these plugins require native platform implementations that don't exist in the Flutter test environment.

## The Solution

We've created a centralized test helper file (`test/test_helpers.dart`) that mocks all platform-specific plugins used in the app.

### Quick Start

```dart
import 'package:flutter_test/flutter_test.dart';
import 'test_helpers.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    
    // This single function sets up all plugin mocks
    setupPlatformPluginMocks();
    
    // Your initialization code here...
  });
  
  tearDownAll(() async {
    // Clean up mock handlers
    clearAllMockMethodCallHandlers();
  });
}
```

## Mocked Plugins

The following plugins are automatically mocked when you call `setupPlatformPluginMocks()`:

### 1. FlutterSecureStorage
- **Channel**: `plugins.it_nomads.com/flutter_secure_storage`
- **Methods**: `read`, `write`, `delete`, `deleteAll`, `readAll`
- **Behavior**: Returns empty strings/maps, no-op for write/delete

### 2. Firebase Core
- **Channel**: `plugins.flutter.io/firebase_core`
- **Methods**: `Firebase#initializeCore`, `Firebase#initializeApp`
- **Behavior**: Returns mock Firebase configuration

### 3. Firebase Auth
- **Channel**: `plugins.flutter.io/firebase_auth`
- **Behavior**: Returns null for all operations

### 4. Firebase Messaging
- **Channel**: `plugins.flutter.io/firebase_messaging`
- **Methods**: `Messaging#getToken`
- **Behavior**: Returns mock FCM token

### 5. SharedPreferences
- Uses Flutter's built-in mock: `SharedPreferences.setMockInitialValues({})`

## Adding New Plugin Mocks

If you add a new platform plugin to the project and get `MissingPluginException` during tests:

1. **Open** `test/test_helpers.dart`

2. **Create a new mock function**:
```dart
void _mockYourPlugin() {
  const MethodChannel yourChannel =
      MethodChannel('your.plugin.channel');
  
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(yourChannel, (MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'yourMethod':
        return 'mock-value';
      default:
        return null;
    }
  });
}
```

3. **Call it from `setupPlatformPluginMocks()`**:
```dart
void setupPlatformPluginMocks() {
  SharedPreferences.setMockInitialValues({});
  _mockFlutterSecureStorage();
  _mockFirebaseCore();
  _mockFirebaseAuth();
  _mockFirebaseMessaging();
  _mockYourPlugin(); // Add your new mock here
}
```

4. **Add the channel to cleanup**:
```dart
void clearAllMockMethodCallHandlers() {
  const channels = [
    'plugins.it_nomads.com/flutter_secure_storage',
    'plugins.flutter.io/firebase_core',
    'plugins.flutter.io/firebase_auth',
    'plugins.flutter.io/firebase_messaging',
    'your.plugin.channel', // Add your channel here
  ];
  // ...
}
```

## Finding Plugin Channel Names

To find the channel name for a plugin:

1. Check the plugin's source code on pub.dev
2. Look for `MethodChannel` initialization
3. Or check the error message - it usually shows the channel name

Example error:
```
MissingPluginException(No implementation found for method read on channel plugins.it_nomads.com/flutter_secure_storage)
                                                                                  ↑
                                                                          Channel name
```

## Running Tests

### Locally
```bash
flutter test
```

### With Verbose Output
```bash
flutter test --verbose
```

### Specific Test File
```bash
flutter test test/widget_test.dart
```

### With Coverage
```bash
flutter test --coverage
```

## CI/CD Integration

The GitHub Actions workflow (`.github/workflows/flutter.yml`) automatically runs tests with these mocks:

```yaml
- name: Run tests
  run: flutter test
```

All platform plugins are properly mocked, so tests run successfully in the CI environment.

## Best Practices

1. **Always use `setupPlatformPluginMocks()`** in your test setup
2. **Don't mock plugins individually** - use the centralized helper
3. **Clean up mocks** in `tearDownAll` using `clearAllMockMethodCallHandlers()`
4. **Keep test_helpers.dart updated** when adding new plugins
5. **Document any custom mock behavior** in comments

## Troubleshooting

### Tests Still Failing?

1. **Ensure binding is initialized first**:
   ```dart
   TestWidgetsFlutterBinding.ensureInitialized();
   ```

2. **Check plugin initialization order** - some plugins depend on others

3. **Verify mock returns correct data type** - check the plugin's expected return types

4. **Add debug logging** to see what methods are being called:
   ```dart
   .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
     print('Method called: ${methodCall.method}');
     print('Arguments: ${methodCall.arguments}');
     // ... rest of mock
   });
   ```

### Common Errors

| Error | Solution |
|-------|----------|
| `MissingPluginException` | Add plugin mock to `test_helpers.dart` |
| `type 'Null' is not a subtype of type 'String'` | Mock is returning null instead of expected type |
| `Bad state: No element` | Mock needs to return a list/map with elements |

## Additional Resources

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Flutter Test Mocking](https://docs.flutter.dev/cookbook/testing/unit/mocking)
- [Platform Channel Testing](https://docs.flutter.dev/development/platform-integration/platform-channels#testing)

---

**Last Updated**: October 2025

