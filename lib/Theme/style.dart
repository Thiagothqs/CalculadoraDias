import 'package:flutter/material.dart';

class AppTheme {
  static String fontFamily = '';
  static Color primaryColor = Color(0xff5bd419);
  static Color hintColor = Color(0xff686868);
  static Color ratingsColor = Color(0xff51971B);
  static Color starColor = Color(0xffB6E025);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: primaryColor,
    hintColor: hintColor,
    backgroundColor: Color(0xff272727),
    primaryColorLight: Colors.white,
    dividerColor: hintColor,
    cardColor: Color(0xff202020),

    ///appBar theme
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
      centerTitle: true,
    ),

    ///text theme
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      button: TextStyle(fontSize: 16.5),
      bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      caption: TextStyle(color: hintColor),
    ).apply(),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xfff4f9f1),
    primaryColor: primaryColor,
    hintColor: hintColor,
    backgroundColor: Colors.white,
    primaryColorLight: Colors.black,
    dividerColor: hintColor,
    cardColor: Colors.white,

    ///appBar theme
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
      centerTitle: true,
    ),

    ///text theme
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      button: TextStyle(fontSize: 16.5),
      // headline6: TextStyle(color: Colors.black),
      // headline5: TextStyle(color: Colors.black),
      // bodyText1: TextStyle(color: Colors.black),
      // subtitle1: TextStyle(color: Colors.black),
      // subtitle2: TextStyle(color: Colors.black),
      bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      caption: TextStyle(color: hintColor),
    ).apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
      decorationColor: Colors.black,
    ),
  );
}

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
