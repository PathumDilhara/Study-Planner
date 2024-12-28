class CourseModel {
  final String id;
  final String name;
  final String description;
  final String duration;
  final String schedule;
  final String instructor;

  CourseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.schedule,
    required this.instructor,
  });

  //; Json top dart
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? '',
      schedule: json['schedule'] ?? '',
      instructor: json['instructor'] ?? '',
    );
  }

  // Dart to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'schedule': schedule,
      'instructor': instructor,
    };
  }
}
