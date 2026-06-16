import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/raduis_manager.dart';
import 'package:news_apps/core/utils/styles.dart';

void showSnackBar(BuildContext context, String message) {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: Styles.textStyle18),
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorManager.offBlack,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusManager.r8)),
    ),
  );
}
