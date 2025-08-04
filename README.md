# 📱 Babylon App

Welcome to **Babylon**, a Flutter application developed as part of a technical assessment for **Babylon Radio**. This app showcases best practices in Flutter development using clean architecture (MVVM), Firebase Authentication, runtime localization, dependency injection, and a modular design system.

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
* ✅ Responsive UI and dark mode support  
* ✅ Modular code for reusability and maintainability  

---

## 📁 Folder Structure

```

lib/
├── app/
│   ├── features/
│   │   ├── login/
│   │   │   ├── view/login\_view\.dart
│   │   │   ├── viewmodel/login\_view\_model.dart
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

````

---

## 🔧 Technologies Used

| Technology         | Purpose                         |
|--------------------|---------------------------------|
| Flutter            | Cross-platform UI toolkit       |
| Firebase Auth      | User authentication             |
| Provider           | State management (view updates) |
| get_it             | Dependency Injection            |
| MVVM               | Scalable architecture           |
| Dart Extension     | Clean reusable code             |
| Modular Components | Buttons, TextFields, Icons      |

---

## 🚀 Getting Started

### ✅ Prerequisites

* Flutter >= 3.16.9  
* Dart >= 3.2.0  

### 🔧 Installation

```bash
git clone https://github.com/williansw/babylon-willian.git
cd babylon-willian
flutter pub get
````

---

## 🔐 Firebase Setup

To run the app with Firebase Authentication enabled, you need to download and include the configuration file:

📱 **Android**:

→ Download the file from the following link:

[google-services.json](https://drive.google.com/file/d/1cUCQmOwoH1z6pj_Pvhigsoj5oBVSu9Px/view?usp=sharing)

→ Then, place it in the following directory:

```
babylon/android/app/google-services.json
```

> ⚠️ This file is excluded from the repository via `.gitignore` for security reasons and must be added locally before running the app.

---

## 🌍 Localization

The app supports **English** and **Portuguese**, with a `LanguageSelector` widget that allows users to switch languages at runtime.

```dart
// Language enum
enum LanguageEnum { english, portuguese }

// Usage via R object
Text(R.loginButton)
```

---

## 🧠 Architecture

The application is structured using the **MVVM (Model-View-ViewModel)** pattern, ensuring a clean and scalable codebase:

* `View` – UI widgets only
* `ViewModel` – Logic and state (Provider-based)
* `Model` – Entities and DTOs
* `Service` – Firebase, localization, etc.

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

* New users can register using **email, password, and full name**
* Firebase securely stores credentials
* Authenticated users are redirected to the Home screen
* Users can log out via `FirebaseAuth.instance.signOut()`

---

## 🎨 Design System

The app uses a centralized design system to ensure consistency across components:

* Colors – `AppColor`
* Spacing – `Spacing`
* Typography – `AppTextStyle`
* Custom widgets – `CustomButton`, `AppLogoIcon`, `AppLogoText`, etc.

---

## 🧪 Manual Testing

The application has been manually tested for the following flows:

* ✅ User registration
* ✅ Login
* ✅ Logout and session management
* ✅ Language switching
* ✅ UI responsiveness on multiple devices

---

## 👨‍💻 Author

**Willian Oliveira**
Flutter Developer
[LinkedIn](https://www.linkedin.com/in/willian-natieres-67109934/) • [GitHub](https://github.com/williansw)

---

## 📜 License

MIT License © 2025