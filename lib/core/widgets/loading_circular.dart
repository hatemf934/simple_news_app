import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: ColorManager.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
