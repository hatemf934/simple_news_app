import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_apps/core/error/failure.dart';
import 'package:news_apps/core/services/news_services.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:news_apps/features/home/data/repos/repo_news.dart';

class RepoNewsImplement extends RepoNews {
  final NewsServices newsservices;

  RepoNewsImplement({required this.newsservices});
  @override
  Future<Either<Failure, List<NewsModel>>> getNews(
      {required String catorgy}) async {
    try {
      List<dynamic> getnews = await newsservices.getNews(catorgy: catorgy);
      List<NewsModel> generalNewsList =
          getnews.map((article) => NewsModel.fromjson(article)).toList();
      return Right(generalNewsList);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } on TypeError catch (e) {
      return Left(GeneralFailure.fromException(e));
    } on FormatException catch (e) {
      return Left(GeneralFailure.fromException(e));
    } catch (e) {
      return Left(GeneralFailure.fromException(e));
    }
  }
}
