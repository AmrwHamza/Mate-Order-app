import 'package:dio/dio.dart';
import 'package:mate_order_app/constants.dart';

class Api {
  final Dio dio;

  Api(this.dio);
  Future<Map<String, dynamic>> post(
      {required endPoint, required data, Map<String, String>? headers}) async {
    var response = await dio.post('$baseurl$endPoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> get(
      {required endPoint, required queryParameters, Map<String, String>? headers}) async {
    var response = await dio.get('$baseurl$endPoint',
        queryParameters: queryParameters, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required endPoint, required data, Map<String, String>? headers}) async {
    var response = await dio.delete('$baseurl$endPoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required endPoint, required data, Map<String, String>? headers}) async {
    var response = await dio.put('$baseurl$endPoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }
}
