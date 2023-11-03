// ignore_for_file: camel_case_types

import 'package:alo_movies/constants/strings.dart';
import 'package:dio/dio.dart';

class OverviewWebServices {
  late Dio dio;

  // Correct the constructor name to match the class name
  OverviewWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getallOverview() async {
    try {
      Response response = await dio.get("traingSeries/1/overview");
      print("fffffffffff${response.data}");
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
