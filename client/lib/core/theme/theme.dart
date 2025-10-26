import 'package:flutter/material.dart';
import './app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(Pallete.borderColor),
      focusedBorder: _border(Pallete.gradient1),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
      titleMedium: const TextStyle(fontSize: 18, color: Pallete.inactiveSeekColor),
    ),
  );
}
