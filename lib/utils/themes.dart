import 'package:flutter/material.dart';

class ScreenSize {
  static late double height;
  static late double width;
}

/////////////////////// Theme ///////////////////////
final theme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 22, height: 1.4),
    caption: TextStyle(fontSize: 18, height: 1.4),
    headline1: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);

/////////////////////// Global Colors ///////////////////////
Color mainBlue = const Color.fromRGBO(0, 111, 198, 1);
Color paleBlueGrey = const Color.fromARGB(255, 99, 134, 178);
Color deepBlueGrey = const Color.fromARGB(255, 70, 96, 126);
Color paleSkyBlue = const Color.fromARGB(255, 223, 237, 251);
Color globalColor_1Blue = const Color.fromRGBO(97, 157, 226, 1);
Color globalColor_2Blue = const Color.fromRGBO(74, 144, 226, 1);
Color globalColor_3Blue = const Color.fromRGBO(120, 169, 226, 1);
Color globalColor_4Blue = const Color.fromRGBO(100, 135, 176, 1);
Color globalColor_5Blue = const Color.fromRGBO(71, 97, 125, 1);
Color globalColor_6Blue = const Color.fromRGBO(23, 148, 248, 1);
Color globalColor_7Blue = const Color.fromRGBO(17, 168, 239, 1);
Color globalColor_8White = const Color.fromRGBO(236, 242, 249, 1);
Color globalColor_9Black = const Color.fromRGBO(20, 30, 42, 1);
Color globalColor_10Orange = const Color.fromRGBO(254, 124, 0, 1);
Color globalColor_11Red = const Color.fromRGBO(226, 74, 74, 1);
Color globalColor_12LightGrey = const Color.fromRGBO(249, 249, 249, 1);
Color globalColor_13DarkBlue = const Color.fromRGBO(18, 35, 64, 1);
Color globalColor_14DarkGrey = const Color.fromRGBO(113, 114, 115, 1);
Color globalColor_15LightOrange = const Color.fromRGBO(255, 185, 6, 1);
Color globalColor_16Blue = const Color.fromRGBO(223, 237, 250, 1);
Color globalColor_17VeryDarkGray = const Color.fromRGBO(74, 74, 74, 1);
Color globalColor_18Green = const Color.fromRGBO(184, 233, 134, 1);
Color globalColor_19Red = const Color.fromRGBO(208, 2, 27, 1);
Color globalColor_20WineRed = const Color.fromRGBO(102, 53, 73, 1);
