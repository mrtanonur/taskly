import 'package:flutter/material.dart';
import 'package:taskly/utils/constants/constants.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.grey900,
    textTheme: const TextTheme(
        labelMedium: TextStyle(color: ColorConstants.white),
        bodyLarge: TextStyle(color: ColorConstants.white),
        bodyMedium: TextStyle(color: ColorConstants.white),
        bodySmall: TextStyle(color: ColorConstants.white),
        titleLarge: TextStyle(color: ColorConstants.white),
        titleMedium: TextStyle(color: ColorConstants.white),
        titleSmall: TextStyle(color: ColorConstants.white)),
    colorScheme: const ColorScheme.dark(
      surface: ColorConstants.black,
      primary: ColorConstants.white,
      secondary: ColorConstants.white,
      tertiary: ColorConstants.white,
      inversePrimary: ColorConstants.grey500,
      error: ColorConstants.red,
      outline: ColorConstants.green,
    ));
