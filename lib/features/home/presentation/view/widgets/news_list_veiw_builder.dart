import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/core/services/api_class.dart';
import 'package:news_apps/core/services/news_services.dart';
import 'package:news_apps/features/home/data/repos/repo_news_implement.dart';
import 'package:news_apps/features/home/presentation/bloc/getNews/getnews_cubit.dart';
import 'package:news_apps/features/home/presentation/view/widgets/news_list_veiw.dart';
import 'package:news_apps/core/widgets/loading_circular.dart';

class NewsListVeiwBuilder extends StatelessWidget {
  const NewsListVeiwBuilder({super.key, required this.catorgy});
  final String catorgy;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetnewsCubit(
          RepoNewsImplement(newsservices: NewsServices(apiClass: ApiClass())))
        ..getAllNews(catorgy: catorgy),
      child: BlocBuilder<GetnewsCubit, GetnewsState>(
        builder: (context, state) {
          if (state is GetnewsSucsses) {
            return NewsListVeiw(generalNewsList: state.newsmodel);
          } else if (state is GetnewsFailure) {
            return SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(state.iconData),
                    Text(state.error),
                  ],
                ),
              ),
            );
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
