<div align="center">

# 📰 News Hub

### *All the news that matters, in one place.*

A Flutter application for browsing, searching, and reading the latest news — organized by category, with full light/dark theme support.

[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/State-BLoC%2FCubit-8B5CF6)](https://bloclibrary.dev)
[![Dio](https://img.shields.io/badge/Networking-Dio-13B9FD)](https://pub.dev/packages/dio)
[![Hive](https://img.shields.io/badge/Local%20DB-Hive-FF6B35)](https://pub.dev/packages/hive)

</div>

---

## 📖 Table of Contents

- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Packages Used](#packages-used)
- [Architecture](#architecture)
- [Screenshots](#screenshots)
- [Download APK](#download-apk)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [Connect](#connect)

---

## About

**News Hub** is a Flutter application that pulls live articles from a news API and presents them in a clean, organized feed. Browse general headlines on the home screen, dive into specific categories, search for topics that interest you, and read full article details — complete with image, source, author, and a link to the original story. Switch between light and dark themes at any time, with your preference remembered across sessions.

---

## Features

| Feature | Description |
|---|---|
| 🏠 **General News Feed** | Home screen lists the latest general news in a vertical `ListView` |
| 🔍 **Search** | Search articles by keyword across the news feed |
| 🌗 **Theme Switching** | Toggle between light and dark themes, persisted locally via Hive so it survives app restarts |
| 📄 **Article Details** | Full details per article: image, title, source/publisher, author, and a short description |
| 🔗 **Open Original Article** | Opens the article's original source link in the browser via `url_launcher` |
| 📤 **Share Article** | Share any article with other apps using `share_plus` |

---

## Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | Flutter / Dart |
| **State Management** | flutter_bloc (Bloc/Cubit) |
| **Networking** | Dio (REST API consumption) |
| **Local Storage** | Hive (theme preference persistence) |
| **Functional Error Handling** | dartz (`Either`) |
| **Architecture** | Clean Architecture + MVVM |

---

## Packages Used

| Package | Purpose |
|---|---|
| `flutter_bloc` | State management (Bloc/Cubit) |
| `dio` | HTTP client for consuming the news API |
| `hive` / `hive_flutter` | Local storage — persists the selected theme |
| `get_it` | Service locator for dependency injection |
| `dartz` | Functional error handling with `Either` |
| `firebase_core` | Firebase initialization |
| `share_plus` | Share articles to other apps |
| `url_launcher` | Open the original article link in the browser |
| `shimmer` | Shimmer loading placeholders |
| `animated_splash_screen` | Animated splash screen |
| `intl` | Date and text formatting |

---

## Architecture

News Hub follows **Clean Architecture** with a clear separation of concerns across 3 layers, combined with the **MVVM** pattern, organized into `core` and `features`:

```
lib/
├── core/
└── features/
    ├── home/
    │   ├── data/
    │   └── presentation/
    └── cardview/
        ├── data/
        └── presentation/
```

> Every feature follows the same `data` → `presentation` structure shown above.

**Data Flow:**
```
UI (Presentation) → Cubit/Bloc → Repository → Data Sources (API / Hive)
```

> No hardcoded strings or values — all text, constants, and configuration live under `core`, keeping the UI layer clean and fully maintainable.
> The selected theme is persisted locally via Hive, so the app reopens in the same theme the user left it in.

---

## Screenshots

<div align="center">

| Splash | Home | Card View |
|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/923c4a4e-bf33-4fbc-a818-facb486c0da2" width="200"/> | <img src="https://github.com/user-attachments/assets/17692693-4f70-4980-a73d-c79b62db4f10" width="200"/> | <img src="https://github.com/user-attachments/assets/eedc9058-ace0-40f4-891a-e0d8fbd5cfc0" width="200"/> |

| Search | Article Details | Dark Theme |
|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/c7b1786c-a15a-40ab-8fe0-e504e1032afa" width="200"/> | <img src="https://github.com/user-attachments/assets/4a6e3cb1-ad21-4eb1-8181-c365021b37f5" width="200"/> | <img src="https://github.com/user-attachments/assets/4f8c9c26-6e4e-48e9-8ab3-2dcf16a0c399" width="200"/> |

</div>

---

## Download APK

<div align="center">

### [⬇️ Download APK](https://drive.google.com/file/d/1YOm-rDfz3UkfUFXpxpddqg9RG1yOQDSK/view?usp=sharing)

<br/>
Scan to download:
<br/><br/>
<img src="https://github.com/user-attachments/assets/ee30941b-a087-4758-98a2-6fd84ea08880"width="200"/>

</div>

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable)
- Android Studio / VS Code
- An API key from your chosen news provider (e.g. [NewsAPI.org](https://newsapi.org))

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/hatemf934/news_hub.git
   cd news_hub
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Add your News API key:**
   - Add your API key wherever the app's network config expects it (e.g. `core/services/api_constants.dart` or an environment file) — never commit it directly to a public repo.

4. **Generate Hive adapters:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app:**
   ```bash
   flutter run
   ```

---

## Contributing

Contributions are welcome! For major changes, please open an issue first to discuss what you'd like to change.

1. Fork the repository
2. Create your feature branch:
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/AmazingFeature
   ```
5. Open a Pull Request

---

## Connect

| | |
|---|---|
| GitHub | [github.com/hatemf934](https://github.com/hatemf934) |
| LinkedIn | [linkedin.com/in/hatem-fathy-92002a369](https://www.linkedin.com/in/hatem-fathy-92002a369/) |
| Gmail | [hatemf934@gmail.com](mailto:hatemf934@gmail.com) |

---

<div align="center">
  <sub>Built with ❤️ using Flutter</sub>
</div>
