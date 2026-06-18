import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/font_manager.dart';

class ThemeModel {
  final darkMode = ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.offBlack,
      primaryColor: ColorManager.offBlack,
      primaryColorDark: ColorManager.surfaceColor,
      primaryColorLight: ColorManager.darkGreyModifier,
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: ColorManager.mediumGrey,
      ),
      textTheme: const TextTheme(
          titleSmall: TextStyle(
        color: ColorManager.mediumGrey,
        fontSize: FontManager.font24,
        fontWeight: FontWeight.bold,
      )));

  final ligthMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.scaffoldColorThemeOne,
    primaryColor: ColorManager.primaryColorThemeOne,
    primaryColorDark: ColorManager.dustyGreen,
    primaryColorLight: ColorManager.offBlack,
    colorScheme: const ColorScheme.light().copyWith(
      secondary: ColorManager.primaryColorThemeOne,
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(
      color: ColorManager.blackColor,
      fontSize: FontManager.font24,
      fontWeight: FontWeight.bold,
    )),
  );
}
