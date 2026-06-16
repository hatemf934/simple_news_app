import 'package:news_apps/features/home/data/models/source_model.dart';

class NewsModel {
  final String? imageNews;
  final String descreption;
  final String title;
  final DateTime publishedAt;
  final String content;
  final SourceModel sourceModel;

  const NewsModel({
    required this.publishedAt,
    required this.content,
    required this.title,
    required this.imageNews,
    required this.descreption,
    required this.sourceModel,
  });

  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
      sourceModel: SourceModel.fromJson(json["source"]),
      imageNews: json["urlToImage"],
      descreption: json["description"],
      title: json['title'],
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"],
    );
  }
}
