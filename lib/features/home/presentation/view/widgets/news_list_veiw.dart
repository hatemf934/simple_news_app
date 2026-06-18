import 'package:flutter/material.dart';
import 'package:news_hub/features/home/data/models/news_model.dart';
import 'package:news_hub/features/home/presentation/view/widgets/News_tile.dart';

// ignore: must_be_immutable
class NewsListVeiw extends StatelessWidget {
  NewsListVeiw(
      {super.key, required this.generalNewsList, required this.catogery});
  List<NewsModel> generalNewsList;
  final String catogery;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: generalNewsList.length,
      (context, index) {
        return NewsTile(
          news: generalNewsList[index],
          catogery: catogery,
        );
      },
    ));
  }
}
