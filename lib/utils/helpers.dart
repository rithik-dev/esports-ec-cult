import 'package:flutter/material.dart';

class Helpers {
  const Helpers._();

  static void showSnackBar(
    BuildContext context, {
    required String text,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static bool isNullOrBlank(String? data) =>
      data == null || data.trim().isEmpty;
}
