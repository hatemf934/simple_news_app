import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/font_manager.dart';
import 'package:news_hub/core/utils/height_manager.dart';

class CustomSearchResults extends StatelessWidget {
  const CustomSearchResults(
      {super.key, required this.icon, required this.textResults});
  final IconData icon;
  final String textResults;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: FontManager.font64, color: ColorManager.darkGreyModifier),
          const SizedBox(height: HeightManager.h16),
          Text(
            textResults,
            style: const TextStyle(
              fontSize: FontManager.font16,
              fontWeight: FontWeight.w400,
              color: ColorManager.darkGreyModifier,
            ),
          ),
        ],
      ),
    );
  }
}
