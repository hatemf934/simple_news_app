import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/font_manager.dart';

class CustomContaierIconButton extends StatelessWidget {
  const CustomContaierIconButton(
      {super.key, required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: ColorManager.lightGrey,
          size: FontManager.font24,
        ));
  }
}
