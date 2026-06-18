import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_apps/core/error/failure.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:news_apps/features/home/data/repos/repo_news_implement.dart';

part 'getnews_state.dart';

class GetnewsCubit extends Cubit<GetnewsState> {
  GetnewsCubit(this.repoNewsImplement) : super(GetnewsInitial());
  final RepoNewsImplement repoNewsImplement;
  Future<void> getAllNews({required String catorgy}) async {
    emit(GetnewsLoading());
    var result = await repoNewsImplement.getNews(catorgy: catorgy);
    result.fold(
      (failre) {
        emit(GetnewsFailure(failure: failre));
      },
      (news) {
        emit(GetnewsSucsses(newsmodel: news));
      },
    );
  }
}
