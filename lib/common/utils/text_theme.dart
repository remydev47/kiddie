import 'package:flutter/material.dart';
import 'package:kiddie/common/utils/kcolors.dart';
import 'package:kiddie/common/widgets/app_style.dart';

class FTextTheme {
  FTextTheme._();
  
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: appStyle(32, Kolors.kDark, FontWeight.bold),
    headlineMedium: appStyle(24, Kolors.kDark, FontWeight.w600),
  );
  static TextTheme darkTextTheme = TextTheme(
     headlineLarge: appStyle(32, Kolors.kWhite, FontWeight.bold),
    headlineMedium: appStyle(24, Kolors.kWhite, FontWeight.w600),
  );
}