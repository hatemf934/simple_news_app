import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/core/helper/on_generate.dart';
import 'package:news_apps/cubits/theme_cubit/theme-cubit.dart';
import 'package:news_apps/cubits/theme_cubit/theme_cubit_state.dart';
import 'package:news_apps/models/modetheme.dart';
import 'package:news_apps/features/home/presentation/view/homepage.dart';

void main() {
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
                ? Modetheme().ligthMode
                : Modetheme().darkMode,
            debugShowCheckedModeBanner: false,
            home: const Homepage(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: Homepage.id,
          );
        },
      ),
    );
  }
}
