import 'package:news_hub/constant.dart';
import 'package:news_hub/core/services/hive_services.dart';
import 'package:news_hub/features/theme/data/repo/theme_repo.dart';

class ThemeRepoImplement extends ThemeRepo {
  final HiveServices hiveServices;

  ThemeRepoImplement({required this.hiveServices});
  @override
  Future<void> addTheme({required bool isDark}) async {
    await hiveServices.addData(boxName: themeBox, data: isDark);
  }

  @override
  bool? getTheme() {
    return hiveServices.getData<bool>(boxName: themeBox);
  }
}
