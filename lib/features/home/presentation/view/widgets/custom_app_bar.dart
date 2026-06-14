import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/cubits/theme_cubit/theme-cubit.dart';
import 'package:news_apps/features/home/presentation/view/widgets/custom_search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: TextManager.newsText,
              style:
                  Styles.textStyle24.copyWith(color: ColorManager.blackColor),
            ),
            TextSpan(
              text: TextManager.cloudText,
              style:
                  Styles.textStyle24.copyWith(color: ColorManager.witheColor),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearch(),
            );
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().themechange();
          },
          icon: const Icon(Icons.dark_mode),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
