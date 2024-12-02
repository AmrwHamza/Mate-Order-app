import 'package:dio/dio.dart';
import 'package:mate_order_app/constants.dart';

class Api {
  late Dio dio;

  Api() {
    {
      BaseOptions options = BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
      );

      dio = Dio(options);
    }
  }
  Future<Map<String, dynamic>> post(
      {required endPoint, required data, Map<String, String>? headers}) async {
    try {
      var response = await dio.post(
        '$endPoint',
        data: data,
        options: Options(headers: headers),
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('==============================');
      print('==============================');
      print(e.toString());
      print('==============================');
      return {};
    }
  }

  Future<Map<String, dynamic>> get(
      {required endPoint,
      queryParameters,
      Map<String, String>? headers}) async {
    try {
      var response = await dio.get('$endPoint',
          queryParameters: queryParameters ?? {},
          options: Options(headers: headers));
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('==============================');
      print(e.toString());
      print('==============================');
      return {};
    }
  }

  Future<Map<String, dynamic>> delete(
      {required endPoint, required data, Map<String, String>? headers}) async {
    try {
      var response = await dio.delete('$endPoint',
          data: data, options: Options(headers: headers));
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('==============================');
      print(e.toString());
      print('==============================');
      return {};
    }
  }

  Future<Map<String, dynamic>> put(
      {required endPoint, data, Map<String, String>? headers}) async {
    try {
      var response = await dio.put('$endPoint',
          data: data, options: Options(headers: headers));
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('==============================');
      print(e.toString());
      print('==============================');
      return {};
    }
  }
}
