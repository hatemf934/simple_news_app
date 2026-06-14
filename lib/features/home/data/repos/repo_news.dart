import 'package:dartz/dartz.dart';
import 'package:news_apps/core/error/failure.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

abstract class RepoNews {
  Future<Either<Failure, List<NewsModel>>> getNews({required String catorgy});
}
