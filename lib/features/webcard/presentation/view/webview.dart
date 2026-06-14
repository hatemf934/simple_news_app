import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/models/news_model.dart';
import 'package:news_apps/features/webcard/presentation/view/widgets/one_page_news.dart';

class Webview extends StatelessWidget {
  const Webview({super.key, required this.news});
  final NewsModel news;
  static const String id = RouteManager.webview;
  @override
  Widget build(BuildContext context) {
    return OnePageNews(news: news);
  }
}
