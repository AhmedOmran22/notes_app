import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
  });

  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBoreder(),
        enabledBorder: buildBoreder(),
        focusedBorder: buildBoreder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBoreder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}