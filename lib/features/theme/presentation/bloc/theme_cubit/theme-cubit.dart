import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/core/services/hive_services.dart';
import 'package:news_hub/features/theme/data/repo/theme_repo_implement.dart';
import 'package:news_hub/features/theme/presentation/bloc/theme_cubit/theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitState.light) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final isDark =
        ThemeRepoImplement(hiveServices: HiveServices()).getTheme() ?? false;
    emit(isDark ? ThemeCubitState.dark : ThemeCubitState.light);
  }

  Future<void> saveTheme(bool isDark) async {
    await ThemeRepoImplement(hiveServices: HiveServices())
        .addTheme(isDark: isDark);
  }

  void themeChange() {
    if (state == ThemeCubitState.light) {
      emit(ThemeCubitState.dark);
      saveTheme(true);
    } else {
      emit(ThemeCubitState.light);
      saveTheme(false);
    }
  }
}
