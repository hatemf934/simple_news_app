import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/core/helper/server_locator.dart';
import 'package:news_hub/core/widgets/error_view.dart';
import 'package:news_hub/core/widgets/loading_circular.dart';
import 'package:news_hub/features/home/data/repos/repo_news_implement.dart';
import 'package:news_hub/features/home/presentation/bloc/getNews/getnews_cubit.dart';
import 'package:news_hub/features/home/presentation/view/widgets/news_list_veiw.dart';

class NewsListVeiwBuilder extends StatelessWidget {
  const NewsListVeiwBuilder({super.key, required this.catogery});
  final String catogery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetnewsCubit(getIt<RepoNewsImplement>())
        ..getAllNews(catorgy: catogery),
      child: BlocBuilder<GetnewsCubit, GetnewsState>(
        builder: (context, state) {
          if (state is GetnewsSucsses) {
            return NewsListVeiw(
              generalNewsList: state.newsmodel,
              catogery: catogery,
            );
          } else if (state is GetnewsFailure) {
            return SliverToBoxAdapter(
                child: ErrorView(
              failure: state.failure,
              onRetry: () =>
                  context.read<GetnewsCubit>().getAllNews(catorgy: catogery),
            ));
          } else {
            return const SliverToBoxAdapter(
              child: LoadingCircular(),
            );
          }
        },
      ),
    );
  }
}
