import 'package:flutter/material.dart';
import 'package:news_apps/models/news_model.dart';
import 'package:news_apps/features/home/presentation/view/widgets/News_tile.dart';

// ignore: must_be_immutable
class NewsListVeiw extends StatelessWidget {
  NewsListVeiw({super.key, required this.generalNewsList});
  List<NewsModel> generalNewsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: generalNewsList.length,
      (context, index) {
        return NewsTile(news: generalNewsList[index]);
      },
    ));
  }
}
