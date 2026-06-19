import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/features/theme/presentation/bloc/theme_cubit/theme-cubit.dart';
import 'package:news_hub/core/widgets/custom_flexible_space.dart';
import 'package:news_hub/core/widgets/custom_text_title_app.dart';
import 'package:news_hub/features/search/presentation/views/custom_search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: const CustomFlexibleSpace(),
      title: const CustomTextTitleApp(),
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
            context.read<ThemeCubit>().themeChange();
          },
          icon: const Icon(Icons.dark_mode),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
