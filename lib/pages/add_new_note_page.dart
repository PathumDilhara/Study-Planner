import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_planner/models/assignment_model.dart';
import 'package:study_planner/models/course_model.dart';
import 'package:study_planner/widgets/custom_button.dart';
import 'package:study_planner/widgets/custom_inputfield_widget.dart';
import 'package:study_planner/widgets/snackbar_widget.dart';

class AddNewNotePage extends StatefulWidget {
  final CourseModel course;
  const AddNewNotePage({
    super.key,
    required this.course,
  });

  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _selectedImage;

  // Method to pick an image
  Future<void> _picker() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      print("object");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Note For Your Course',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              //description
              const Text(
                'Fill in the details below to add a new note. And start managing your study planner.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInputFieldWidget(
                      controller: _titleController,
                      labelText: "Note Title",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter the note title";
                        }
                        return null;
                      },
                    ),

                    CustomInputFieldWidget(
                      controller: _descriptionController,
                      labelText: "Note Description",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter the note description";
                        }
                        return null;
                      },
                    ),
                    CustomInputFieldWidget(
                      controller: _sectionController,
                      labelText: "Note Section",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter the note section";
                        }
                        return null;
                      },
                    ),

                    CustomInputFieldWidget(
                      controller: _referenceController,
                      labelText: "Note Reference book",
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter the note reference book";
                        }
                        return null;
                      },
                    ),

                    const Divider(),
                    const Text(
                      'Upload Note Image , for better understanding and quick revision',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),

                    CustomButton(
                      title: "Upload Note Image",
                      onPressed: () => _picker(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // pick an image
                    _selectedImage != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selected Image",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_selectedImage!.path),
                                  width: double.infinity,
                                  height: 200,
                                ),
                              )
                            ],
                          )
                        : Text(
                            "No image selected",
                          ),

                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: "Submit",
                      onPressed: () {
                        _submitForm(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
