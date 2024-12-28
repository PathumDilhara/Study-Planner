import 'package:flutter/material.dart';
import 'package:study_planner/models/course_model.dart';

class AddNewNotePage extends StatelessWidget {
  final CourseModel course;
  const AddNewNotePage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
