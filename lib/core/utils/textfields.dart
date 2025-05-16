import 'package:first_try/constants.dart';
import 'package:flutter/material.dart';

abstract class Textfields {
  static TextFormField loginTextField({
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    Widget? suffixIcon,
    int maxLines = 1,
    String? Function(String?)? validator, 
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      maxLines: isPassword ? 1 : maxLines,
      validator: validator, 
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontFamily: 'DMSans',
        ),
        suffixIcon: suffixIcon,
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
