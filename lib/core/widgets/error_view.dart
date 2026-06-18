import 'package:flutter/material.dart';
import 'package:news_apps/core/error/failure.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/font_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/text_manager.dart';

class ErrorView extends StatelessWidget {
  final Failure failure;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.failure, required this.onRetry});

  IconData get icon => switch (failure) {
        ServerFailure failure when failure.statusCode == 404 =>
          Icons.search_off,
        ServerFailure failure when failure.statusCode == 401 =>
          Icons.lock_outline,
        ServerFailure _ => Icons.cloud_off,
        CacheFailure _ => Icons.storage,
        _ => Icons.warning_amber_rounded,
      };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.p24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: FontManager.font64, color: ColorManager.greyColor),
            const SizedBox(height: HeightManager.h16),
            Text(
              failure.userMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: FontManager.font16),
            ),
            if (failure.canRetry) ...[
              const SizedBox(height: HeightManager.h24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text(TextManager.tryAgain),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
