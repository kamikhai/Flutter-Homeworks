import 'package:flutter/material.dart';

class AppThemeData {
  static const Color darkGray = Color(0xFF1E1E1E);
  static const Color gray = Color(0xFF7D7D7D);
  static const Color lightGray = Color(0xFFBDBBBB);

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: darkGray,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkGray,
          shadowColor: Color(0xFF2B2B2B),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
            subtitle1: TextStyle(color: gray),
            bodyText2: TextStyle(color: gray)),
        dividerColor: gray,
        dialogBackgroundColor: Colors.black,
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(color: lightGray, fontSize: 18),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: darkGray,
          hintStyle: TextStyle(color: lightGray),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: lightGray,
          ),
        ),
        iconTheme: const IconThemeData(color: darkGray),
        cardColor: darkGray);
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: lightGray,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightGray,
        shadowColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: darkGray)),
      dividerColor: gray,
      dialogBackgroundColor: Colors.white,
      dialogTheme: const DialogTheme(
        titleTextStyle: TextStyle(color: darkGray, fontSize: 18),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: lightGray,
        hintStyle: TextStyle(color: darkGray),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: darkGray,
        ),
      ),
      iconTheme: const IconThemeData(color: lightGray),
      cardColor: lightGray,
    );
  }
}
