import 'package:first_try/constants.dart';
import 'package:flutter/material.dart';

abstract class Elevatedbuttons {
  static ElevatedButton blue_elevatedbutton({
    required String text,
    required VoidCallback onPressed,  // Added required onPressed parameter
  }) {
    return ElevatedButton(
      onPressed: onPressed,  // Using the passed onPressed function
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10),
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}