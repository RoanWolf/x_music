import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hint: Text(hintText)),
      controller: controller,
      obscureText: isObscureText,
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return "$hintText is missing";
        }

        final emailRegex = RegExp(
          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
        );
        
        if (!emailRegex.hasMatch(val.trim())) {
          return "Please enter a valid email address";
        }

        return null;
      },
    );
  }
}
