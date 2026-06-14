import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/core/cubits/theme_cubit/theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitState.light);

  themechange() {
    emit(state == ThemeCubitState.light
        ? ThemeCubitState.dark
        : ThemeCubitState.light);
  }
}
