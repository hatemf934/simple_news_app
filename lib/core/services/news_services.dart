import 'package:news_apps/core/services/api_class.dart';

class NewsServices {
  final ApiClass apiClass;

  NewsServices({required this.apiClass});
  Future<List<dynamic>> getNews({required String catorgy}) async {
    Map<String, dynamic> data = await apiClass.getApi(
      endPoints:
          "https://newsapi.org/v2/everything?q=$catorgy&apiKey=0703d2fabe5e469b81abf9cbc1850334",
    );
    return data["articles"];
  }
}
