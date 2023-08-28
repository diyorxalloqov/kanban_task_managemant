import 'package:flutter/material.dart';

class KanbanTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffF4F7FD),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffFFFFFF),
        titleTextStyle: TextStyle(
            color: Color(0xFF000112),
            fontWeight: FontWeight.w700,
            fontSize: 18),
      ),
      cardColor: Colors.white,
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)));

  static final ThemeData _darkTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff2B2C37),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      useMaterial3: true,
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      cardColor: const Color(0xff2B2C30).withBlue(1),
      scaffoldBackgroundColor: const Color(0xff20212C));
}
