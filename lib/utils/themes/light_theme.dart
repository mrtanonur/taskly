import 'package:flutter/material.dart';
import 'package:taskly/utils/constants/constants.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.white,
    textTheme: const TextTheme(
        labelMedium: TextStyle(color: ColorConstants.black),
        bodyLarge: TextStyle(color: ColorConstants.black),
        bodyMedium: TextStyle(color: ColorConstants.black),
        bodySmall: TextStyle(color: ColorConstants.black),
        titleLarge: TextStyle(color: ColorConstants.black),
        titleMedium: TextStyle(color: ColorConstants.black),
        titleSmall: TextStyle(color: ColorConstants.black)),
    colorScheme: const ColorScheme.light(
      surface: ColorConstants.grey100,
      primary: ColorConstants.grey800,
      secondary: ColorConstants.grey800,
      tertiary: ColorConstants.grey800,
      inversePrimary: ColorConstants.grey500,
      error: ColorConstants.red,
      outline: ColorConstants.green,
    ));
