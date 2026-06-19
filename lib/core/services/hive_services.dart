import 'package:hive/hive.dart';
import 'package:news_hub/core/services/local_data_base_services.dart';
import 'package:news_hub/core/utils/text_manager.dart';

class HiveServices extends LocalDatabaseServices {
  @override
  Future<void> addData<T>({required String boxName, required T data}) async {
    var box = Hive.box<T>(boxName);
    await box.put(TextManager.isDark, data);
  }

  @override
  getData<T>({required String boxName}) {
    final box = Hive.box<T>(boxName);
    return box.get(TextManager.isDark);
  }
}
