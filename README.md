# Freelancer App

A modern, feature-rich freelancer platform built with Flutter. This application provides a comprehensive solution for connecting freelancers with clients, offering seamless authentication, profile management, and multi-language support.

## 📋 Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Localization](#localization)
- [CI/CD](#cicd)
- [Contributing](#contributing)
- [License](#license)

## 🚀 About the Project

Freelancer App is a cross-platform mobile application designed to bridge the gap between freelancers and clients. Built with Flutter for optimal performance and a native feel on both iOS and Android, the app features a clean architecture, robust state management, and seamless user experience.

### Key Highlights

- 🔐 Secure authentication with Firebase
- 🌍 Multi-language support (English, Arabic, Urdu)
- 📱 Clean and modern UI/UX
- 🏗️ Scalable architecture using BLoC pattern
- 🔔 Push notifications support
- 💾 Secure local storage
- 🌐 RESTful API integration

## ✨ Features

- **Authentication & Authorization**
  - User registration and login
  - OTP verification
  - Password reset functionality
  - Secure session management
  
- **Profile Management**
  - User profile creation and editing
  - Account settings
  - Account deletion with password verification
  
- **Client Features**
  - Browse freelancer profiles
  - Post jobs and projects
  - Real-time messaging
  
- **Multi-language Support**
  - English (EN)
  - Arabic (AR)
  - Urdu (UR)
  
- **Notifications**
  - Firebase Cloud Messaging integration
  - Real-time push notifications

## 🛠️ Tech Stack

### Core Technologies
- **Flutter** - UI Framework (SDK: ^3.8.1)
- **Dart** - Programming Language

### State Management & Architecture
- **flutter_bloc** (^9.1.1) - State management
- **get_it** (^8.2.0) - Dependency injection
- **dartz** (^0.10.1) - Functional programming

### Backend & Networking
- **dio** (^5.9.0) - HTTP client
- **retrofit** (^4.7.3) - Type-safe REST client
- **pretty_dio_logger** (^1.4.0) - Network logging

### Firebase Services
- **firebase_core** (^4.2.0) - Core Firebase functionality
- **firebase_auth** (^6.1.1) - Authentication
- **firebase_messaging** (^16.0.3) - Push notifications

### UI & UX
- **flutter_screenutil** (^5.9.3) - Responsive UI
- **flutter_svg** (^2.2.1) - SVG rendering
- **lottie** (^3.3.1) - Animations
- **skeletonizer** (^2.1.0+1) - Loading skeletons
- **flutter_html** (^3.0.0) - HTML rendering
- **pin_code_fields** (^8.0.1) - OTP input
- **country_code_picker** (^3.4.1) - Country selection

### Storage & Persistence
- **flutter_secure_storage** (^9.2.4) - Secure local storage
- **shared_preferences** (^2.3.4) - Simple key-value storage

### Localization
- **easy_localization** (^3.0.8) - Internationalization

### Development Tools
- **build_runner** (^2.9.0) - Code generation
- **retrofit_generator** (^10.0.6) - Retrofit code generation
- **json_serializable** (^6.11.1) - JSON serialization
- **flutter_lints** (^5.0.0) - Linting rules

## 📦 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.32.1 or higher
  - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK**: Comes with Flutter
- **Android Studio** or **Xcode** (for Android/iOS development)
- **Git**
- **Firebase Project**: Create a project on [Firebase Console](https://console.firebase.google.com/)

### Installation

1. **Clone the repository**

```bash
git clone <repository-url>
cd freelancer
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Generate required code**

Run the following command to generate code for Retrofit, JSON serialization, and other code generation libraries:

```bash
dart run build_runner build --delete-conflicting-outputs
```

> ⚠️ **Important**: This command must be run after `flutter pub get` and whenever you make changes to files that require code generation (files with `@retrofit`, `@JsonSerializable`, etc.).

4. **Firebase Configuration**

- Place your `google-services.json` file in `android/app/`
- Place your `GoogleService-Info.plist` file in `ios/Runner/`
- Ensure Firebase is properly configured in your project

### Running the App

#### Debug Mode

```bash
flutter run
```

#### Release Mode

```bash
# Android
flutter run --release

# iOS
flutter run --release
```

### Building the App

#### Android APK

```bash
flutter build apk --release
```

#### Android App Bundle

```bash
flutter build appbundle --release
```

#### iOS

```bash
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/              # Dependency injection setup
│   ├── errors/          # Error handling
│   ├── helper/          # Helper utilities
│   ├── networking/      # API configuration
│   ├── routes/          # Navigation routes
│   ├── shared/          # Shared resources
│   ├── theme/           # App theme configuration
│   └── widgets/         # Reusable widgets
├── features/
│   ├── auth/            # Authentication feature
│   ├── client/          # Client-related features
│   ├── common/          # Common features
│   └── home/            # Home screen
├── generated/           # Generated localization files
├── firebase_options.dart
└── main.dart            # App entry point
```

### Architecture

The project follows **Clean Architecture** principles with a feature-first approach:

- **Presentation Layer**: UI components and BLoC state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: API integration and data models

## ⚙️ Configuration

### Environment Setup

The app uses different configurations for development and production. Update the following files as needed:

- `lib/core/networking/` - API endpoints and configurations
- `lib/core/di/` - Dependency injection setup
- Firebase configuration files for each platform

### Code Generation

When you modify any of the following, run the build_runner command:

- API endpoints (Retrofit annotations)
- Data models (JSON serialization)
- Localization keys

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 🌍 Localization

The app supports three languages:

- **English** (en)
- **Arabic** (ar)
- **Urdu** (ur)

Translation files are located in `assets/translations/`:
- `en.json`
- `ar.json`
- `ur.json`

To add a new language:
1. Create a new JSON file in `assets/translations/`
2. Add translations following the existing structure
3. Run code generation

## 🧪 Testing

### Running Tests

```bash
flutter test
```

### Test Setup

The project uses mock implementations for platform-specific plugins during testing. All mocks are configured in `test/test_helpers.dart`.

#### Mocked Plugins:
- **flutter_secure_storage** - Secure storage operations
- **firebase_core** - Firebase initialization
- **firebase_auth** - Authentication
- **firebase_messaging** - Push notifications
- **shared_preferences** - Key-value storage

#### Creating New Tests

When creating new tests, import and use the test helpers:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'test_helpers.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    
    // Setup all platform plugin mocks
    setupPlatformPluginMocks();
    
    // Your additional setup...
  });
  
  tearDownAll(() async {
    // Clear all mock handlers
    clearAllMockMethodCallHandlers();
  });
  
  // Your tests here...
}
```

### Troubleshooting Tests

#### MissingPluginException

If you encounter `MissingPluginException` for any plugin during tests, it means the plugin needs to be mocked. Add the mock implementation to `test/test_helpers.dart`.

Example error:
```
MissingPluginException(No implementation found for method read on channel plugins.it_nomads.com/flutter_secure_storage)
```

This has been resolved by adding proper mocks in the test setup.

## 🔄 CI/CD

The project includes a GitHub Actions workflow for continuous integration:

- **Automated Testing**: Runs on every push and pull request to `main` branch
- **Code Analysis**: Ensures code quality with `flutter analyze`
- **Build Verification**: Verifies the app builds successfully

Workflow file: `.github/workflows/flutter.yml`

### Workflow Steps:
1. Checkout code
2. Set up Flutter (3.32.1)
3. Install dependencies (`flutter pub get`)
4. Generate code (`dart run build_runner build --delete-conflicting-outputs`)
5. Analyze code (`flutter analyze`)
6. Run tests (`flutter test`)

### CI/CD Best Practices

- All platform plugins are properly mocked for testing
- Code generation runs before analysis to ensure generated files are up-to-date
- Tests run in a clean environment with mocked platform channels

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style

- Follow the [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Run `flutter analyze` before committing
- Ensure all tests pass
- Write meaningful commit messages

## 📄 License

This project is private and not published to pub.dev. All rights reserved.

## 📞 Support

For support and queries:
- Create an issue in the repository
- Contact the development team

---

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Retrofit Guide](https://pub.dev/packages/retrofit)

---

**Built with ❤️ using Flutter**
