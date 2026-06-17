import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/font_manager.dart';

class Modetheme {
  final darkMode = ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.offBlack,
      primaryColor: ColorManager.offBlack,
      primaryColorDark: ColorManager.surfaceColor,
      primaryColorLight: ColorManager.darkGreyModifier,
      indicatorColor: ColorManager.greyColor,
      textTheme: const TextTheme(
          titleSmall: TextStyle(
        color: ColorManager.mediumGrey,
        fontSize: FontManager.font24,
        fontWeight: FontWeight.bold,
      )));

  final ligthMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffFFFAF3),
    primaryColor: const Color(0xff618764),
    primaryColorDark: const Color(0xff9CB080),
    primaryColorLight: ColorManager.offBlack,
    indicatorColor: const Color(0xff618764),
    textTheme: const TextTheme(
        titleSmall: TextStyle(
      color: ColorManager.blackColor,
      fontSize: FontManager.font24,
      fontWeight: FontWeight.bold,
    )),
  );
}
