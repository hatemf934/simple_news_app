import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/width_manager.dart';

class CustomFloatingActionBotton extends StatelessWidget {
  const CustomFloatingActionBotton(
      {super.key, required this.scrollController, required this.showButton});
  final ScrollController scrollController;
  final bool showButton;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: showButton ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: ColorManager.transparentColor,
        child: Container(
          width: WidthManager.w56,
          height: HeightManager.h56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(38),
                blurRadius: 12,
                offset: const Offset(0, 4),
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_upward,
            color: ColorManager.witheColor,
          ),
        ),
      ),
    );
  }
}
