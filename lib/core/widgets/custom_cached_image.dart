import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/height_manager.dart';
import 'package:news_hub/core/utils/raduis_manager.dart';
import 'package:news_hub/core/widgets/error_cached_image.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const ErrorCachedImage();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(RadiusManager.r8),
      child: Image.network(imageUrl!,
          height: HeightManager.h200,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
              baseColor: ColorManager.shimmerBase,
              highlightColor: ColorManager.shimmerHighlight,
              child: Container(
                height: HeightManager.h200,
                color: ColorManager.shimmerBase,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) =>
              const ErrorCachedImage()),
    );
  }
}
