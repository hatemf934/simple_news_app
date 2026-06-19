abstract class ThemeRepo {
  Future<void> addTheme({
    required bool isDark,
  });

  bool? getTheme();
}
