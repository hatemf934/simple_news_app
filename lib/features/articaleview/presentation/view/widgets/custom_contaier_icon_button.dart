import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/font_manager.dart';
import 'package:news_apps/core/utils/padding_manager.dart';

class CustomContaierIconButton extends StatelessWidget {
  const CustomContaierIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.height,
      required this.width});
  final IconData icon;
  final VoidCallback onTap;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.darkGrey,
          ),
          child: Icon(
            icon,
            color: ColorManager.greyColor,
            size: FontManager.font24,
          ),
        ),
      ),
    );
  }
}
