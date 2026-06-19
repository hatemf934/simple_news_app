abstract class LocalDatabaseServices {
  Future<void> addData<T>({required String boxName, required T data});

  getData<T>({required String boxName});
}
