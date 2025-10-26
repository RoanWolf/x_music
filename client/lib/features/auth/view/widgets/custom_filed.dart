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

        if (hintText == "Email") {
          if (!val.contains("@")) {
            return "Invalid Email";
          }
        }

        if (hintText == "Password" && val.length < 6) {
          return "Password must be at least 6 characters";
        }

        return null;
      },
    );
  }
}
