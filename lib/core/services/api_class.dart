import 'package:dio/dio.dart';

class ApiClass {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getApi({required String endPoints}) async {
    Response response = await dio.get(endPoints);
    Map<String, dynamic> data = response.data;
    return data;
  }
}
