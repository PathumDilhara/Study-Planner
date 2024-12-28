import 'package:flutter/material.dart';

import '../models/course_model.dart';

class AddNewAssignmentPage extends StatelessWidget {
  final CourseModel course;
  const AddNewAssignmentPage({
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
