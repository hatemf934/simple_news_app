import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/font_manager.dart';

@override
ThemeData appBarThemechange(BuildContext context, ThemeData theme) {
  return theme.copyWith(
    appBarTheme: theme.appBarTheme.copyWith(
      backgroundColor: ColorManager.transparentColor,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintStyle: TextStyle(
        color: ColorManager.lightGrey,
        fontSize: FontManager.font22,
      ),
    ),
    textTheme: theme.textTheme.copyWith(
      titleLarge: const TextStyle(
        color: ColorManager.lightGrey,
        fontSize: FontManager.font22,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorManager.witheColor,
        selectionColor: ColorManager.witheColor24,
        selectionHandleColor: ColorManager.witheColor),
  );
}
