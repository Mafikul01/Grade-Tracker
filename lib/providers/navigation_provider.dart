import 'package:flutter/material.dart';

/// Provider for managing the current index of the bottom navigation bar.
class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  /// Returns the current active screen index.
  int get currentIndex => _currentIndex;

  /// Updates the active screen index and notifies listeners.
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
