import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/font_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/core/widgets/error_view.dart';
import 'package:news_apps/core/widgets/loading_circular.dart';
import 'package:news_apps/features/home/presentation/bloc/getNews/getnews_cubit.dart';
import 'package:news_apps/features/home/presentation/view/widgets/news_list_veiw.dart';

Widget buildSearchBody(BuildContext context, GetnewsCubit cubit, String query) {
  return BlocProvider.value(
    value: cubit,
    child: BlocBuilder<GetnewsCubit, GetnewsState>(
      builder: (context, state) {
        if (state is GetnewsSucsses) {
          final searchQuery = query.toLowerCase();
          final filteredList = state.newsmodel.where((news) {
            final title = news.title.toLowerCase();
            final description = news.descreption.toLowerCase();
            return title.contains(searchQuery) ||
                description.contains(searchQuery);
          }).toList();

          if (filteredList.isEmpty) {
            return const CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: FontManager.font64,
                          color: ColorManager.darkGreyModifier,
                        ),
                        SizedBox(height: HeightManager.h16),
                        Text(
                          TextManager.noResults,
                          style: TextStyle(
                              fontSize: FontManager.font16,
                              color: ColorManager.darkGreyModifier),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return CustomScrollView(
            slivers: [
              NewsListVeiw(
                generalNewsList: filteredList,
                catogery: "generals",
              ),
            ],
          );
        } else if (state is GetnewsFailure) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ErrorView(
                  failure: state.failure,
                  onRetry: () => cubit.getAllNews(catorgy: "generals"),
                ),
              ),
            ],
          );
        } else {
          return const CustomScrollView(
            slivers: [SliverToBoxAdapter(child: LoadingCircular())],
          );
        }
      },
    ),
  );
}
