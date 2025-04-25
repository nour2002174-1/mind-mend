import 'package:flutter/material.dart';

Widget otpfield(BuildContext context, TextEditingController controller) {
  return Container(
    height: 60,
    width: 50,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 1,
      style: TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}