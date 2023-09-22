import 'package:flutter/material.dart';

class KanbanTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;

  static final ThemeData _lightTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffF4F7FD),
      cardTheme: const CardTheme(color: Color(0xffF4F7FD)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffFFFFFF),
        titleTextStyle: TextStyle(
            color: Color(0xFF000112),
            fontWeight: FontWeight.w700,
            fontSize: 18),
      ),
      cardColor: Colors.white,
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)));

  static final ThemeData _darkTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      cardTheme: const CardTheme(color: Color(0xff20212C)),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff2B2C37),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      cardColor: const Color(0xff2B2C30).withBlue(1),
      scaffoldBackgroundColor: const Color(0xff20212C));
}
