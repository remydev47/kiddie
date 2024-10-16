import 'package:flutter/material.dart';
import 'package:kiddie/common/utils/kcolors.dart';
import 'package:kiddie/common/utils/text_theme.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Kolors.kPrimary,
    scaffoldBackgroundColor: Kolors.kWhite,
    textTheme: FTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Kolors.kPrimary,
    scaffoldBackgroundColor: Kolors.kDark,
    textTheme: FTextTheme.darkTextTheme,
  );

}