import 'package:flutter/material.dart';
import 'package:news_hub/core/models/card_model.dart';
import 'package:news_hub/core/utils/route_manager.dart';
import 'package:news_hub/features/articaleview/presentation/view/articale_view.dart';
import 'package:news_hub/features/cards/presentation/view/cardview.dart';
import 'package:news_hub/features/home/data/models/news_model.dart';
import 'package:news_hub/features/home/presentation/view/homepage.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteManager.homeview:
      return MaterialPageRoute(builder: (context) => const Homepage());
    case RouteManager.cardview:
      final card = routeSettings.arguments as CardModel;
      return MaterialPageRoute(
          builder: (context) => Cardview(catogery: card.nameImage));
    case RouteManager.article:
      final args = routeSettings.arguments as Map<String, dynamic>;
      final news = args['news'] as NewsModel;
      final catogery = args['catogery'] as String;
      return MaterialPageRoute(
          builder: (context) => ArticaleView(
                news: news,
                catogery: catogery,
              ));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
