import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData theme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Galano Grotesque',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Galano Grotesque',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(
        0xffF2F2F7,
      ),
      endIndent: 31,
      indent: 31,
    ),
    fontFamily: 'Galano Grotesque',
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            color: Colors.white,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          Colors.blue,
        ),
      ),
    ),
  );
}
