import 'package:dio/dio.dart';

class ApiClass {
  Dio dio = Dio();

  Future<List<dynamic>> getNews({required String catorgy}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$catorgy&apiKey=0703d2fabe5e469b81abf9cbc1850334");
    List<dynamic> articleGeneralNews = response.data["articles"];
    return articleGeneralNews;
  }
}
