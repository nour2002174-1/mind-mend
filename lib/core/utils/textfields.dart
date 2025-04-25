import 'package:first_try/constants.dart';
import 'package:flutter/material.dart';

abstract class Textfields {
  static TextField loginTextField({
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
     Widget? suffixIcon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      maxLines: isPassword ? 1 : maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontFamily: 'DMSans',
        ),
        filled: true,
        fillColor: grey_color,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
