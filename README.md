# Navalia Code Challenge App

This is a Flutter application for a code challenge. The app supports multiple environments (flavors) for production, staging, and development.

## Table of Contents

- [Navalia Code Challenge App](#navalia-code-challenge-app)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
  - [Flavors](#flavors)
  - [Building and Running](#building-and-running)
    - [Android](#android)
    - [iOS](#ios)

## Getting Started

To get started with this Flutter application, you need to have Flutter installed on your machine. If you don't have Flutter installed, follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

Clone the repository:

```bash
git clone https://github.com/acoutinho12/navalia_code_challenge.git
cd navalia_code_challenge
```

Install dependencies:

```bash
flutter pub get
```

## Flavors

This app supports three flavors:

1. **Production** (`prod`)
2. **Staging** (`staging`)
3. **Development** (`dev`)

Each flavor has its own configuration and entry point.

## Building and Running

### Android

To build and run the app for a specific flavor on Android, use the following commands:

- **Production:**

  ```bash
  flutter build apk --flavor prod -t lib/main_prod.dart
  flutter run --flavor prod -t lib/main_prod.dart
  ```

- **Staging:**

  ```bash
  flutter build apk --flavor staging -t lib/main_staging.dart
  flutter run --flavor staging -t lib/main_staging.dart
  ```

- **Development:**

  ```bash
  flutter build apk --flavor dev -t lib/main_dev.dart
  flutter run --flavor dev -t lib/main_dev.dart
  ```

### iOS

To build and run the app for a specific flavor on iOS, use the following commands:

- **Production:**

  ```bash
  flutter build ios --flavor prod -t lib/main_prod.dart
  flutter run --flavor prod -t lib/main_prod.dart
  ```

- **Staging:**

  ```bash
  flutter build ios --flavor staging -t lib/main_staging.dart
  flutter run --flavor staging -t lib/main_staging.dart
  ```

- **Development:**

  ```bash
  flutter build ios --flavor dev -t lib/main_dev.dart
  flutter run --flavor dev -t lib/main_dev.dart
  ```
