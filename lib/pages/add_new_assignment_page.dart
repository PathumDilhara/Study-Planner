import 'dart:math';

import 'package:flutter/material.dart';
import 'package:study_planner/widgets/custom_button.dart';
import 'package:study_planner/widgets/custom_inputfield_widget.dart';

import '../models/course_model.dart';

class AddNewAssignmentPage extends StatelessWidget {
  final CourseModel course;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _assignmentNameController =
      TextEditingController();
  final TextEditingController _assignmentDescriptionController =
      TextEditingController();
  final TextEditingController _assignmentDurationController =
      TextEditingController();

  // To store date
  final ValueNotifier<DateTime> _selectedDate =
      ValueNotifier<DateTime>(DateTime.now()); // initial value DateTime.now()

  // To store time
  final ValueNotifier<TimeOfDay> _selectedTime =
      ValueNotifier<TimeOfDay>(TimeOfDay.now());

  // constructor
  AddNewAssignmentPage({
    super.key,
    required this.course,
  }) {
    _selectedDate.value = DateTime.now();
    _selectedTime.value = TimeOfDay.now();
  }

  // Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      initialDate: _selectedDate.value,
    );
    if (picked != null && picked != _selectedDate.value) {
      _selectedDate.value = picked;
    }
  }

  // Time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime.value,
    );
    if (picked != null && picked != _selectedTime.value) {
      _selectedTime.value = picked;
    }
  }

  // Submit form
  void _submitForm(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      print(_selectedDate.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add New Assignment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                //description
                const Text(
                  'Fill in the details below to add a new assignment. And start managing your study planner.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                CustomInputFieldWidget(
                  controller: _assignmentNameController,
                  labelText: "Assignment name",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter the assignment name";
                    }
                    return null;
                  },
                ),
                CustomInputFieldWidget(
                  controller: _assignmentDescriptionController,
                  labelText: "Assignment Description",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter the assignment description";
                    }
                    return null;
                  },
                ),
                CustomInputFieldWidget(
                  controller: _assignmentDurationController,
                  labelText: "Duration (eg. 1 hour)",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter the assignment duration";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                const Divider(),
                const Text(
                  'Due Date and Time',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(height: 16),

                ValueListenableBuilder<DateTime>(
                  valueListenable: _selectedDate, // listening
                  builder: (context, date, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Date : ${date.toLocal().toString().split(" ")[0]}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _selectDate(context),
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                ValueListenableBuilder<TimeOfDay>(
                  valueListenable: _selectedTime, // listening
                  builder: (context, time, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Time : ${time.format(context)}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _selectTime(context),
                          icon: Icon(
                            Icons.access_time,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  title: "Add Assignment",
                  onPressed: () => _submitForm(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
