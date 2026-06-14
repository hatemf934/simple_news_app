import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/models/card_model.dart';
import 'package:news_apps/models/news_model.dart';
import 'package:news_apps/views/cardview.dart';
import 'package:news_apps/views/homepage.dart';
import 'package:news_apps/views/webview.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteManager.homeview:
      return MaterialPageRoute(builder: (context) => const Homepage());
    case RouteManager.cardview:
      final card = routeSettings.arguments as CardModel;
      return MaterialPageRoute(
          builder: (context) => Cardview(catogery: card.nameImage));
    case RouteManager.webview:
      final news = routeSettings.arguments as NewsModel;
      return MaterialPageRoute(builder: (context) => Webview(news: news));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
