import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/subject.dart';

/// Provider for managing the list of subjects and their statistics.
class SubjectProvider with ChangeNotifier {
  List<Subject> _subjects = [];
  static const String _key = 'user_subjects';

  SubjectProvider() {
    _loadFromPrefs();
  }

  /// Returns an unmodifiable list of subjects.
  List<Subject> get subjects => List.unmodifiable(_subjects);

  /// Returns the total number of subjects added.
  int get totalSubjects => _subjects.length;

  /// Calculates the average mark across all subjects.
  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final int total = _subjects.fold(0, (sum, item) => sum + item.mark);
    return total / _subjects.length;
  }

  /// Determines the overall grade based on the average mark.
  String get overallGrade {
    final double avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  /// Returns the number of subjects with a passing mark (>= 50).
  int get passingSubjectsCount {
    return _subjects.where((s) => s.mark >= 50).length;
  }

  /// Adds a new subject and persists the change.
  void addSubject(String name, int mark) {
    _subjects.add(Subject(name: name, mark: mark));
    _saveToPrefs();
    notifyListeners();
  }

  /// Deletes a subject at the given index and persists the change.
  void deleteSubject(int index) {
    _subjects.removeAt(index);
    _saveToPrefs();
    notifyListeners();
  }

  // Persistence logic for SharedPreferences
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      _subjects.map((s) => s.toJson()).toList(),
    );
    await prefs.setString(_key, encodedData);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString(_key);
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      _subjects = decodedData.map((item) => Subject.fromJson(item)).toList();
      notifyListeners();
    }
  }
}
