// ignore_for_file: camel_case_types

import 'package:alo_movies/constants/strings.dart';
import 'package:dio/dio.dart';

class trainingSeriesWebServices {
  late Dio dio;

  // Correct the constructor name to match the class name
  trainingSeriesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllChaterers() async {
    try {
      Response response = await dio.get("traingSeries");
      print("fffffffffff${response.data}");
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
