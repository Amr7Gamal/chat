import 'package:flutter/material.dart';

class MyTheme {
  static final Color lightBlueColor = Color(0xFF3598DB);
  static final Color whiteColor = Colors.white;
  static final Color blackColor = Colors.black;

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:
          AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      primaryColor: lightBlueColor,
      backgroundColor: whiteColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: lightBlueColor),
        unselectedIconTheme: IconThemeData(color: blackColor),
        selectedItemColor: lightBlueColor,
        unselectedItemColor: blackColor,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: lightBlueColor),
          headline2: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: whiteColor),
          headline3: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
          headline4: TextStyle(fontSize: 14, color: lightBlueColor),
          headline5: TextStyle(fontSize: 14, color: Colors.black26)));
}
