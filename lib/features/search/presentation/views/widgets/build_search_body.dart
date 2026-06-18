import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/core/utils/text_manager.dart';
import 'package:news_hub/core/widgets/error_view.dart';
import 'package:news_hub/core/widgets/loading_circular.dart';
import 'package:news_hub/features/home/presentation/bloc/getNews/getnews_cubit.dart';
import 'package:news_hub/features/home/presentation/view/widgets/news_list_veiw.dart';
import 'package:news_hub/features/search/presentation/views/widgets/custom_search_results.dart';

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
                    child: CustomSearchResults(
                        icon: Icons.search_off,
                        textResults: TextManager.noResults)),
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
