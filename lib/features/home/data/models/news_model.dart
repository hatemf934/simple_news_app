class NewsModel {
  final String? imageNews;
  final String descreption;
  final String title;
  final String publishedAt;
  final String content;

  const NewsModel({
    required this.publishedAt,
    required this.content,
    required this.title,
    required this.imageNews,
    required this.descreption,
  });

  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
      imageNews: json["urlToImage"],
      descreption: json["description"],
      title: json['title'],
      publishedAt: json["publishedAt"],
      content: json["content"],
    );
  }
}
