import 'package:get_it/get_it.dart';
import 'package:news_apps/core/services/api_class.dart';
import 'package:news_apps/core/services/news_services.dart';
import 'package:news_apps/features/home/data/repos/repo_news_implement.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<ApiClass>(ApiClass());
  getIt.registerSingleton<NewsServices>(
      NewsServices(apiClass: getIt<ApiClass>()));
  getIt.registerLazySingleton<RepoNewsImplement>(
    () => RepoNewsImplement(newsservices: getIt<NewsServices>()),
  );
}
