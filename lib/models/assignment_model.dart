import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignmentModel {
  final String id;
  final String name;
  final String description;
  final String duration;
  final DateTime dueDate;
  final TimeOfDay dueTime;

  AssignmentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.dueDate,
    required this.dueTime,
  });

  // TimeOfDay : Commonly used in Flutter to work with times independently of dates

  // The Timestamp in Firestore represents a point in time, consisting of both
  // date and time components. It is commonly used for storing time-related data,
  // such as creation dates, update timestamps, independent of any time zone or calendar

  // Convert a map from Firestore to an Assignment instance
  factory AssignmentModel.fromJson(Map<String, dynamic> data) {
    return AssignmentModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      duration: data['duration'] ?? '',
      dueDate: (data['dueDate'] as Timestamp).toDate(),
      dueTime: TimeOfDay.fromDateTime((data['dueTime'] as Timestamp).toDate()),
    );
  }

  // Convert an Assignment instance to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'duration': duration,
      'dueDate': Timestamp.fromDate(dueDate),
      'dueTime': Timestamp.fromDate(
        DateTime(
          dueDate.year,
          dueDate.month,
          dueDate.day,
          dueTime.hour,
          dueTime.minute,
        ),
      ),
    };
  }
}
