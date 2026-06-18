import 'package:dartz/dartz.dart';
import 'package:news_hub/core/error/failure.dart';
import 'package:news_hub/features/home/data/models/news_model.dart';

abstract class RepoNews {
  Future<Either<Failure, List<NewsModel>>> getNews({required String catorgy});
}
