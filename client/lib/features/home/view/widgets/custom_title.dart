import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';


class CustomTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomTitle({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Pallete.whiteColor,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            '查看更多',
            style: TextStyle(fontSize: 14, color: Pallete.greenColor),
          ),
        ),
      ],
    );
  }
}
