# 📱 Babylon App

Welcome to **Babylon**, a Flutter application developed as part of a technical assessment for **Babylon Radio**. This app demonstrates best practices in Flutter development using clean architecture (MVVM), Firebase Authentication, localization, dependency injection, and a modular design system.

---

## ✨ Features

* ✅ Firebase Authentication (Email & Password)
* ✅ User Registration and Login
* ✅ Persistent Authentication
* ✅ Localization: 🇬🇧 English & 🇧🇷 Portuguese
* ✅ MVVM Architecture
* ✅ Dependency Injection with `get_it`
* ✅ Custom Design System (colors, spacing, styles, widgets)
* ✅ Splash screen with animated logo
* ✅ Responsive UI and dark mode ready
* ✅ Code separation for reusability and testability

---

## 📁 Folder Structure

```
lib/
├── app/
│   ├── features/
│   │   ├── login/
│   │   │   ├── view/login_view.dart
│   │   │   ├── viewmodel/login_view_model.dart
│   │   │   └── widgets/...
│   │   ├── home/
│   │   └── splash/
│   ├── core/
│   │   ├── common/
│   │   │   ├── extension/
│   │   │   ├── service/
│   │   │   ├── ui/components/
│   │   │   └── ui/widgets/
│   │   ├── constants/
│   │   │   ├── images/
│   │   │   ├── languages/
│   │   │   └── values/
│   │   ├── style/
│   │   ├── navigator/
│   │   └── base/
├── main.dart
```

---

## 🔧 Technologies Used

| Technology         | Purpose                         |
| ------------------ | ------------------------------- |
| Flutter            | Cross-platform UI toolkit       |
| Firebase Auth      | User authentication             |
| Provider           | State management (view updates) |
| get\_it            | Dependency Injection            |
| MVVM               | Scalable architecture           |
| Dart Extension     | Clean reusable code             |
| Modular Components | Buttons, TextFields, Icons      |

---

## 🚀 Getting Started

### ✅ Prerequisites

* Flutter >= 3.16.9
* Dart >= 3.2.0
* Firebase Project setup

### 🔧 Installation

```bash
git clone https://github.com/your-username/babylon_app.git
cd babylon_app
flutter pub get
```

### 🔐 Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Enable **Email/Password** authentication
4. Download `google-services.json` and `GoogleService-Info.plist`
5. Add them to:

   * `android/app/` for Android
   * `ios/Runner/` for iOS

---

## 🌍 Localization

The app supports **English** and **Portuguese**, with a `LanguageSelector` widget to change languages at runtime.

```dart
// Languages Enum
enum LanguageEnum { english, portuguese }

// Use via R object
Text(R.loginButton)
```

---

## 🧠 Architecture

We follow the **MVVM pattern**, separated by:

* `View` (Widgets only)
* `ViewModel` (Logic, Provider-based)
* `Model` (Entities or DTOs)
* `Service` (Abstracted logic: Firebase, Localization, etc)

---

## 💉 Dependency Injection

All core services are injected using [`get_it`](https://pub.dev/packages/get_it):

```dart
final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  getIt.registerSingleton<LocateService>(LocateService());
}
```

---

## 🔐 Authentication Flow

* New users are registered using **email, password and full name**
* Firebase stores credentials and returns a `User`
* Logged-in users are redirected to the Home screen
* Logout via `FirebaseAuth.instance.signOut()`

---

## 🎨 Design System

The app uses a central theme for:

* Colors (`AppColor`)
* Spacing (`Spacing`)
* Typography (`AppTextStyle`)
* Reusable widgets (`CustomButton`, `AppLogoIcon`, `AppLogoText`, etc.)

---

## 🧪 Testing

The app was tested manually for:

* ✅ New user registration
* ✅ Existing user login
* ✅ Logout & session invalidation
* ✅ Language switching
* ✅ UI responsiveness

---

## 👨‍💻 Author

**Willian Oliveira**
Flutter Developer
[LinkedIn](https://www.linkedin.com/in/willian-natieres-67109934/) | [GitHub](https://github.com/williansw)

---

## 📜 License

MIT License © 2025