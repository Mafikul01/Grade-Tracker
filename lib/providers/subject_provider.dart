import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/subject.dart';

class SubjectProvider with ChangeNotifier {
  List<Subject> _subjects = [];
  static const String _key = 'user_subjects';

  SubjectProvider() {
    _loadFromPrefs();
  }

  List<Subject> get subjects => List.unmodifiable(_subjects);

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    int total = _subjects.fold(0, (sum, item) => sum + item.mark);
    return total / _subjects.length;
  }

  String get overallGrade {
    double avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  int get passingSubjectsCount {
    return _subjects.where((s) => s.mark >= 50).length;
  }

  void addSubject(String name, int mark) {
    _subjects.add(Subject(name: name, mark: mark));
    _saveToPrefs();
    notifyListeners();
  }

  void deleteSubject(int index) {
    _subjects.removeAt(index);
    _saveToPrefs();
    notifyListeners();
  }

  // Persistence logic
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
