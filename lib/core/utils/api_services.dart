import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

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

  Future<Either<Failure, Map<String, dynamic>>> post(
      {required endPoint, required data, Map<String, String>? headers}) async {
    try {
      var response = await dio.post(
        '$endPoint',
        data: data,
        options: Options(headers: headers),
      );
      print(
          '====================================REsponse DAta ${response.data}');
      return Right(response.data);
    } on DioException catch (dioException) {
      return Left(handleDioError(dioException));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> get(
      {required endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      var response = await dio.get(
        '$endPoint',
        queryParameters: queryParameters ?? {},
        options: Options(headers: headers),
      );
      print(response.data.toString());
      return Right(response.data);
    } on DioException catch (dioException) {
      return Left(handleDioError(dioException));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> delete(
      {required endPoint, required data, Map<String, String>? headers}) async {
    try {
      var response = await dio.delete('$endPoint',
          data: data, options: Options(headers: headers));
      print(response.data.toString());
      return response.data;
    } on DioException catch (dioException) {
      return Left(handleDioError(dioException));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> put(
      {required endPoint, data, Map<String, String>? headers}) async {
    try {
      var response = await dio.put('$endPoint',
          data: data, options: Options(headers: headers));
      print(response.data.toString());
      return Right(response.data);
    } on DioException catch (dioException) {
      return Left(handleDioError(dioException));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  Failure handleDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return TimeoutFailure();
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure('Server response timeout');

      case DioExceptionType.sendTimeout:
        return TimeoutFailure('Request timeout');
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode;
        final errorMessage = getErrorMessage(dioError.response?.data);
        return ServerFailure('Error $statusCode,$errorMessage');
      case DioExceptionType.cancel:
        return UnknownFailure('Request was canceled');
      case DioExceptionType.unknown:
        return UnknownFailure('no internet connection');
      case DioExceptionType.badCertificate:
        return ValidationFailure('bad Certificate');
      case DioExceptionType.connectionError:
        return NetworkFailure('connectio error');
      default:
        return UnknownFailure(dioError.message ?? 'Unexpected error');
    }
  }

  String getErrorMessage(data) {
    if (data is String) {
      return data;
    }
    if (data is Map && data.containsKey('message')) {
      final message = data['message'];
      if (message is String) {
        return message;
      }
      if (message is Map) {
        List<String> errors = [];
        for (var entry in message.entries) {
          final key = entry.key;
          final value = entry.value;
          if (value is List) {
            errors.add('$key: ${value.join(", ")}');
          } else {
            errors.add('$key: $value');
          }
        }
        return errors.join('\n');
      }
    }
    if (data is List) return data.join(', ');

    return 'Unknown error occurred';
  }
}
