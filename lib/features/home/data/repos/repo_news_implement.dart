import 'package:dartz/dartz.dart';
import 'package:news_apps/core/error/failure.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:news_apps/features/home/data/repos/repo_news.dart';

class RepoNewsImplement extends RepoNews {
  @override
  Future<Either<Failure, List<NewsModel>>> getNews() {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}
