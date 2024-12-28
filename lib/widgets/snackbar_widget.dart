import 'package:flutter/material.dart';

void snackBarWidget({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      duration: Duration(seconds: 1),
    ),
  );
}
