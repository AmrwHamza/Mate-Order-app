import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/auth/login/data/models/login_user_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class LoginService {
  late Api api;
  LoginService(this.api);

  Future<Either<Failure, LoginUserModel>> login(
      {required phone, required password}) async {
    final result = await api.post(endPoint: 'auth/login', data: {
      'phone': phone,
      'password': password,
    });

    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(LoginUserModel.fromJson(r));
      },
    );
  }
}
