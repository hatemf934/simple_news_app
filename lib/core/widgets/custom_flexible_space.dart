import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';

class CustomFlexibleSpace extends StatelessWidget {
  const CustomFlexibleSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.offBlack,
            ColorManager.appBarColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
