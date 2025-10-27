/// Test helpers and mocks for platform plugins
///
/// This file contains helper functions to mock platform-specific plugins
/// that don't have implementations in the test environment.
library;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Sets up all necessary mocks for platform plugins used in the app
///
/// Call this in your test's `setUpAll` before initializing dependencies
void setupPlatformPluginMocks() {
  // Mock SharedPreferences
  SharedPreferences.setMockInitialValues({});

  // Mock FlutterSecureStorage
  _mockFlutterSecureStorage();

  // Mock Firebase plugins
  _mockFirebaseCore();
  _mockFirebaseAuth();
  _mockFirebaseMessaging();
}

/// Mocks FlutterSecureStorage plugin
void _mockFlutterSecureStorage() {
  const MethodChannel secureStorageChannel = MethodChannel(
    'plugins.it_nomads.com/flutter_secure_storage',
  );

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(secureStorageChannel, (
        MethodCall methodCall,
      ) async {
        switch (methodCall.method) {
          case 'read':
            // Return empty string for all read operations
            return '';
          case 'write':
          case 'delete':
          case 'deleteAll':
            // Do nothing for write/delete operations
            return null;
          case 'readAll':
            // Return empty map for readAll operations
            return <String, String>{};
          default:
            return null;
        }
      });
}

/// Mocks Firebase Core plugin
void _mockFirebaseCore() {
  const MethodChannel firebaseCoreChannel = MethodChannel(
    'plugins.flutter.io/firebase_core',
  );

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(firebaseCoreChannel, (
        MethodCall methodCall,
      ) async {
        switch (methodCall.method) {
          case 'Firebase#initializeCore':
            return {
              'name': '[DEFAULT]',
              'options': {
                'apiKey': 'test-api-key',
                'appId': 'test-app-id',
                'messagingSenderId': 'test-sender-id',
                'projectId': 'test-project-id',
              },
              'pluginConstants': {},
            };
          case 'Firebase#initializeApp':
            return {
              'name': methodCall.arguments['appName'],
              'options': methodCall.arguments['options'],
              'pluginConstants': {},
            };
          default:
            return null;
        }
      });
}

/// Mocks Firebase Auth plugin
void _mockFirebaseAuth() {
  const MethodChannel firebaseAuthChannel = MethodChannel(
    'plugins.flutter.io/firebase_auth',
  );

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(firebaseAuthChannel, (
        MethodCall methodCall,
      ) async {
        // Return null for all auth operations in test environment
        return null;
      });
}

/// Mocks Firebase Messaging plugin
void _mockFirebaseMessaging() {
  const MethodChannel firebaseMessagingChannel = MethodChannel(
    'plugins.flutter.io/firebase_messaging',
  );

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(firebaseMessagingChannel, (
        MethodCall methodCall,
      ) async {
        switch (methodCall.method) {
          case 'Messaging#getToken':
            return 'test-fcm-token';
          default:
            return null;
        }
      });
}

/// Clears all method call handlers
///
/// Call this in your test's `tearDownAll` to clean up
void clearAllMockMethodCallHandlers() {
  const channels = [
    'plugins.it_nomads.com/flutter_secure_storage',
    'plugins.flutter.io/firebase_core',
    'plugins.flutter.io/firebase_auth',
    'plugins.flutter.io/firebase_messaging',
  ];

  for (final channelName in channels) {
    final channel = MethodChannel(channelName);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  }
}
