class Semester {
  final String semester;

  Semester({required this.semester});

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(semester: map['semester']);
  }

  Map<String, dynamic> toMap() {
    return {
      'semester': semester,
    };
  }
}
