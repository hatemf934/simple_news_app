import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_hub/constant.dart';
import 'package:news_hub/features/splash/presentation/view/custom_animated_splash_screen.dart';
import 'package:news_hub/features/theme/presentation/bloc/theme_cubit/theme-cubit.dart';
import 'package:news_hub/features/theme/presentation/bloc/theme_cubit/theme_cubit_state.dart';
import 'package:news_hub/core/helper/on_generate.dart';
import 'package:news_hub/core/helper/server_locator.dart';
import 'package:news_hub/features/theme/data/model/theme_model.dart';

void main() async {
  setUp();
  await Hive.initFlutter();
  await Hive.openBox<bool>(themeBox);
  runApp(
    const NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state == ThemeCubitState.light
                ? ThemeModel().ligthMode
                : ThemeModel().darkMode,
            debugShowCheckedModeBanner: false,
            home: CustomAnimatedSplashScreen(themeCubitState: state),
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
