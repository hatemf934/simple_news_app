import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/font_manager.dart';

class Styles {
  Styles._();

  static const TextStyle textStyle24 = TextStyle(
    fontSize: FontManager.font24,
  );

  static const TextStyle textStyle15 = TextStyle(
    fontSize: FontManager.font15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle22 = TextStyle(
    fontSize: FontManager.font24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle19 = TextStyle(
    fontSize: FontManager.font19,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle18 = TextStyle(
    fontSize: FontManager.font18,
    color: ColorManager.greyColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleBold15 = TextStyle(
    color: ColorManager.softRed,
    fontSize: FontManager.font15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle11 = TextStyle(
      color: ColorManager.darkGreyModifier, fontSize: FontManager.font11);
}
