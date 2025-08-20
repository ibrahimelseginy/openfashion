import 'package:flutter/material.dart';

class AppUtils {
  /// Show snackbar
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Navigate to screen
  static Future<T?> navigateTo<T>(
    BuildContext context,
    Widget screen, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Format price
  static String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  /// Validate email
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Validate phone
  static bool isValidPhone(String phone) {
    return RegExp(r'^\+?[\d\s-]+$').hasMatch(phone);
  }
}
