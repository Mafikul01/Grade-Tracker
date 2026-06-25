# Grade Tracker Pro 🎓

A modern, high-performance Flutter application designed for students to track their academic progress with ease. Built using the **Provider** state management pattern, this app offers a seamless, reactive user experience with a polished Material 3 interface.

## 🌟 Features

- **Dynamic Subject Management**: Add, view, and delete subjects effortlessly.
- **Bi-directional Deletion**: Swipe left or right on any subject tile to remove it with an instant undo option.
- **Smart Analytics**: Real-time calculation of total subjects, average marks, and overall grade.
- **Automated Grading**: Instant grade assignment (A, B, C, F) based on university-standard marking rules.
- **Adaptive UI**: Beautifully crafted Light and Dark themes that automatically adjust system status bar icons for readability.
- **Data Persistence**: Your subjects and theme preferences are saved locally and persist across app restarts.
- **Smart Forms**: Intelligent focus management and auto-capitalization for faster data entry.

## 🛠 Technologies Used

- **Flutter & Dart**: Core framework and language.
- **Provider**: For robust, reactive state management (100% `setState`-free).
- **Shared Preferences**: For local on-device data persistence.
- **Material 3**: For a modern, cohesive design language.
- **System Services**: For deep integration with system-level UI (status bar controls).

## 📂 Folder Structure

```text
lib/
├── models/
│   └── subject.dart           # Data model with grading logic
├── providers/
│   ├── navigation_provider.dart
│   ├── subject_provider.dart   # Handles persistence & calculations
│   └── theme_provider.dart     # Manages theme state
├── screens/
│   ├── add_subject_screen.dart # Subject entry form
│   ├── subject_list_screen.dart# Interactive subject list
│   └── summary_screen.dart     # Performance dashboard
├── theme/
│   └── app_theme.dart          # Custom theme & overlay definitions
├── widgets/
│   ├── subject_tile.dart       # Custom Dismissible list items
│   └── summary_card.dart       # Gradient-based analytics cards
└── main.dart                   # MultiProvider & App entry point
```

## 🚀 How to Run

Follow these steps to run the project locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Mafikul01/Grade-Tracker.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd grade_tracker
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the application:**
   ```bash
   flutter run
   ```

## ✅ Assignment Requirements Covered

- [x] **Exactly 3 Screens**: Add Subject, Subject List, and Summary.
- [x] **State Management**: Purely managed via **Provider** (Zero `setState` usage).
- [x] **Navigation**: Implemented via `BottomNavigationBar`.
- [x] **Subject Model**: Includes private `_mark`, public getters, and logic-based `grade`.
- [x] **Validation**: Strict validation for subject names and numeric marks (0-100).
- [x] **Theme System**: Custom Light and Dark themes with zero hardcoded colors in widgets.
- [x] **Modern UI**: Full Material 3 implementation with custom branding.

## 🔮 Future Improvements

- **Semester Management**: Group subjects by semester or academic year.
- **GPA Calculator**: Add support for credit hours and GPA/CGPA calculations.
- **Data Export**: Export grade summaries as PDF or CSV.
- **Cloud Sync**: Optional Firebase integration for cross-device synchronization.

---
*Developed as a high-quality Student Grade Tracking solution.*
