import 'package:flutter/material.dart';

class AlertManager {
  displaySnackbar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Color.fromARGB(255, 68, 119, 145),
        duration: const Duration(milliseconds: 3000)));
  }
}
