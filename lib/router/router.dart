import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner/models/course_model.dart';
import 'package:study_planner/pages/add_new_assignment_page.dart';
import 'package:study_planner/pages/add_new_course.dart';
import 'package:study_planner/pages/add_new_note_page.dart';
import 'package:study_planner/pages/home_page.dart';
import 'package:study_planner/pages/single_course_page.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text("This page is not available !"),
          ),
        ),
      );
    },
    routes: [
      // Home page
      GoRoute(
        name: "home_page",
        path: "/",
        builder: (context, state) => HomePage(),
      ),

      // Add new course page
      GoRoute(
        name: "add_new_course_page",
        path: "/add_new_course_page",
        builder: (context, state) => AddNewCourse(),
      ),

      // Single course page
      GoRoute(
        name: "single_course_page",
        path: "/single_course_page",
        builder: (context, state) {
          final CourseModel course = state.extra as CourseModel;
          return SingleCoursePage(course: course);
        },
      ),

      // Add new assignment
      GoRoute(
        name: "add_new_assignment_page",
        path: "/add_new_assignment_page",
        builder: (context, state) {
          final CourseModel course = state.extra as CourseModel;
          return AddNewAssignmentPage(course: course);
        },
      ),

      // Add new note
      GoRoute(
        name: "add_new_note_page",
        path: "/add_new_note_page",
        builder: (context, state) {
          final CourseModel course = state.extra as CourseModel;
          return AddNewNotePage(course: course);
        },
      )
    ],
  );
}
