import 'package:flutter/material.dart';

Future<DateTime?> presentDatePicker(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2101),
    // Set the initialDatePickerMode to DatePickerMode.day to show only the date picker
    initialDatePickerMode: DatePickerMode.day,
  );

  if (pickedDate != null) {
    return pickedDate; // No need to modify the date as time is already ignored
  } else {
    const snackbar = SnackBar(
      content: Text("No date selected..."),
      backgroundColor: Color.fromARGB(255, 251, 161, 242),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    return null;
  }
}
