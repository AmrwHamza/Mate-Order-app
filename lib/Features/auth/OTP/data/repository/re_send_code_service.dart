import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/auth/OTP/data/models/re_send_code_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class ReSendCodeService {
  Future<Either<Failure, ReSendCodeModel>> reSend(
      {required String?token}) async {
    var result = await Api().get(
        endPoint: 'resendCode', headers: {'Authorization': 'Bearer $token'});

    return result.fold(
      (l) => left(l),
      (r) {
        return Right(ReSendCodeModel.fromJson(r));
      },
    );
  }
}
