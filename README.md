# Student Grade Tracker

A modern Flutter application designed to help students track their academic performance across various subjects. Built using a clean architecture and the Provider package for robust state management.

## Features

- **Add Subjects**: Easily input subject names and marks with real-time validation.
- **Subject List**: View all added subjects in a clean list with swipe-to-delete functionality.
- **Grade Calculation**: Automatic grade assignment based on marks (A, B, C, F).
- **Result Summary**: A dedicated dashboard showing total subjects, average marks, overall grade, and passing count.
- **Theme Switching**: Seamlessly toggle between modern Light and Dark themes.
- **Responsive Design**: Built using Material 3 principles for a consistent look across devices.

## Technologies Used

- **Flutter**: UI Framework.
- **Provider**: For state management (Subjects, Theme, and Navigation).
- **Material 3**: For a modern and cohesive design language.

## Provider State Management

The app uses `MultiProvider` at the root to manage three primary states:
1. `SubjectProvider`: Handles the business logic for subjects (adding, deleting, and calculations).
2. `ThemeProvider`: Manages the application's theme mode.
3. `NavigationProvider`: Maintains the current state of the `BottomNavigationBar`.

**Note**: This project strictly avoids the use of `setState()` in favor of the Provider pattern.

## Folder Structure

```text
lib/
├── models/
│   └── subject.dart           # Subject data model and grade logic
├── providers/
│   ├── navigation_provider.dart
│   ├── subject_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── add_subject_screen.dart
│   ├── subject_list_screen.dart
│   └── summary_screen.dart
├── theme/
│   └── app_theme.dart         # Custom light and dark theme definitions
├── widgets/
│   ├── subject_tile.dart      # Reusable list item with Dismissible
│   └── summary_card.dart      # Reusable dashboard metric card
└── main.dart                  # Entry point and MultiProvider setup
```

## How to Run

1. Ensure you have Flutter installed.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to launch the app on your preferred device.

## Screenshots Section
*(Screenshots can be added here)*

## Suggested Commit Messages

- `feat: create subject model and provider`
- `feat: implement screens and navigation`
- `fix: add validation and theme improvements`
- `docs: add README`
