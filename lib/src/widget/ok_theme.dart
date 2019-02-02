import 'package:flutter/material.dart';

class OKTheme {
  static Color themeColor = Colors.blue;

  static Color disableColor = Colors.grey;

  static AppBarTheme appBarTheme = AppBarTheme();

  static Color dividerColor = Colors.grey.withOpacity(0.8);
}

class AppBarTheme {
  double appBarHeight = 50.0;
  double elevation = 0.0;
  double fontSize = 20.0;
  Color titleTextColor;
}
