import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  // showSnackBar is a method that can be called on any BuildContext
  // we can customize a snackbar here
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
