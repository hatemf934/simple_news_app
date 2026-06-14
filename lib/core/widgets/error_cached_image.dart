import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';

class ErrorCachedImage extends StatelessWidget {
  const ErrorCachedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h200,
      width: double.infinity,
      color: ColorManager.shimmerBase,
      child: const Icon(Icons.broken_image, color: ColorManager.greyColor),
    );
  }
}
