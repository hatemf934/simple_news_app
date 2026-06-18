import 'package:flutter/material.dart';
import 'package:news_apps/core/helper/server_locator.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/core/widgets/custom_flexible_space.dart';
import 'package:news_apps/features/home/data/repos/repo_news_implement.dart';
import 'package:news_apps/features/home/presentation/bloc/getNews/getnews_cubit.dart';
import 'package:news_apps/features/search/presentation/views/widgets/build_search_body.dart';
import 'package:news_apps/features/search/presentation/views/widgets/custom_search_results.dart';
import 'package:news_apps/features/search/presentation/views/widgets/theme_app_bar_search.dart';

class CustomSearch extends SearchDelegate {
  CustomSearch()
      : super(
          searchFieldLabel: TextManager.searchForNews,
          keyboardType: TextInputType.text,
        );
  final GetnewsCubit cubit = GetnewsCubit(getIt<RepoNewsImplement>())
    ..getAllNews(catorgy: "generals");

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return appBarThemechange(context, theme);
  }

  @override
  Widget buildFlexibleSpace(BuildContext context) =>
      const CustomFlexibleSpace();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(
            Icons.close,
            color: ColorManager.lightGrey,
          ),
          onPressed: () => query = "")
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios, color: ColorManager.lightGrey));
  }

  @override
  Widget buildResults(BuildContext context) =>
      buildSearchBody(context, cubit, query);

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const CustomSearchResults(
          icon: Icons.search, textResults: TextManager.searchanyNews);
    }
    return buildSearchBody(context, cubit, query);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}
