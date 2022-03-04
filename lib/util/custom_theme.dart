import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red.shade500,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFE6E6E6),
      textTheme: ThemeData.light().textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueAccent))),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red.shade900,
      ),
      scaffoldBackgroundColor: const Color(0xFF181818),
      textTheme: ThemeData.dark().textTheme,
      dividerColor: Colors.grey.shade700,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
      )),
    );
  }
}
