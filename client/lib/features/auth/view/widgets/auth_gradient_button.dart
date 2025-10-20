import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class AuthGradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const AuthGradientButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  State<AuthGradientButton> createState() => _AuthGradientButtonState();
}

class _AuthGradientButtonState extends State<AuthGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
