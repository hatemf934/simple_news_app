import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

class Newsservices {
  final Dio dio;
  Newsservices(this.dio);

  Future<List<NewsModel>> getNews({required String catorgy}) async {
    // لازم (try and catch) عشان ممكن request يجي غلط او مش مظبوط
    try {
      final rosponse = await dio.get(
          "https://newsapi.org/v2/everything?q=$catorgy&apiKey=0703d2fabe5e469b81abf9cbc1850334");
      Map<String, dynamic> jsondata = rosponse.data;
      List<dynamic> articleGeneralNews = jsondata["articles"];
      List<NewsModel> generalNewsList = [];
// convert list of maps to list of objects
      for (var article in articleGeneralNews) {
        NewsModel newsModel = NewsModel(
          title: article["title"],
          imageNews: article["urlToImage"],
          descreption: article["description"],
          publishedAt: article["publishedAt"],
          content: article["content"],
        );
        generalNewsList.add(newsModel);
      }
      return generalNewsList;
    } on DioException catch (e) {
      final String errormesaage =
          e.response?.data["message"] ?? "this is error";
      throw Exception(errormesaage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there is error , try again");
    }
  }
}
