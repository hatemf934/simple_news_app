import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/assets_manager.dart';
import 'package:news_hub/core/utils/font_manager.dart';
import 'package:news_hub/features/home/presentation/view/homepage.dart';
import 'package:news_hub/features/theme/data/model/theme_model.dart';
import 'package:news_hub/features/theme/presentation/bloc/theme_cubit/theme_cubit_state.dart';

class CustomAnimatedSplashScreen extends StatelessWidget {
  const CustomAnimatedSplashScreen({super.key, required this.themeCubitState});
  final ThemeCubitState themeCubitState;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splashIconSize: FontManager.font170,
      splash: Image.asset(AssetsManager.logoSplash),
      nextScreen: const Homepage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: themeCubitState == ThemeCubitState.light
          ? ThemeModel().ligthMode.scaffoldBackgroundColor
          : ThemeModel().darkMode.scaffoldBackgroundColor,
    );
  }
}
