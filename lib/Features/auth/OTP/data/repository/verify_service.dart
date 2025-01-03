import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/auth/OTP/data/models/verify_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class VerifyService {
  late Api api;
  VerifyService(this.api);

  Future<Either<Failure, VerifyModel>> verify(
      {required Map<String, dynamic> data, required String? token}) async {
    final verifyServiceResponse = await api.post(
        endPoint: 'verify',
        data: data,
        headers: {'Authorization': 'Bearer $token'});

    return verifyServiceResponse.fold(
      (failure) => Left(failure),
      (data) => Right(
        VerifyModel.fromJson(data),
      ),
    );
  }
}
