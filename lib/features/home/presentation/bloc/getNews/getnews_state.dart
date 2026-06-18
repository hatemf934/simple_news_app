part of 'getnews_cubit.dart';

@immutable
sealed class GetnewsState {}

final class GetnewsInitial extends GetnewsState {}

final class GetnewsSucsses extends GetnewsState {
  final List<NewsModel> newsmodel;

  GetnewsSucsses({required this.newsmodel});
}

final class GetnewsLoading extends GetnewsState {}

final class GetnewsFailure extends GetnewsState {
  final Failure failure;

  GetnewsFailure({required this.failure});
}
