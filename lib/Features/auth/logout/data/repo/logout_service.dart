import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mate_order_app/Features/auth/logout/data/model/logout_model.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class LogoutService {
  late Api api;

  LogoutService(this.api);

  Future<Either<Failure, LogoutModel>> logout(
      {required String endPoint}) async {
    final response =
        await api.postWithAuth(endPoint: endPoint, data:null);

    return response.fold((failure) => Left(failure),
        (json) => Right(LogoutModel.fromJson(json)));
  }
}
