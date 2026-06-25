/// Represents a student's subject with its name and mark.
class Subject {
  final String name;
  final int _mark;

  Subject({required this.name, required int mark}) : _mark = mark;

  /// Returns the mark obtained in the subject.
  int get mark => _mark;

  /// Returns the grade based on the mark.
  /// A: >= 80, B: >= 65, C: >= 50, F: < 50.
  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }

  /// Converts the [Subject] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {'name': name, 'mark': _mark};
  }

  /// Creates a [Subject] instance from a JSON map.
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(name: json['name'], mark: json['mark']);
  }
}
