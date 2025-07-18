import 'package:dibasys_project/main.dart';
import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  primaryColorLight: Color(0xffD2815E),
  brightness: Brightness.light,
  primaryColor: Color(0xffD2815E),
  highlightColor: Colors.white,
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: customSwatch)
      .copyWith(
        secondary: Colors.white,
        brightness: Brightness.light,
        surface: Colors.white,
      )
      .copyWith(surface: Colors.white),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: Color(0xffD2815E),
  primaryColor: Color(0xffD2815E),
  highlightColor: Color(0xffD2815E),
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: customSwatch,
    brightness: Brightness.dark,
  ).copyWith(surface: Colors.grey[800]),
);
