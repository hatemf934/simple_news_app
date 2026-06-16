import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/one_page_news.dart';

class ArticaleView extends StatelessWidget {
  const ArticaleView({super.key, required this.news, required this.catogery});
  final NewsModel news;
  final String catogery;
  static const String id = RouteManager.article;
  @override
  Widget build(BuildContext context) {
    return OnePageNews(
      news: news,
      catogery: catogery,
    );
  }
}
