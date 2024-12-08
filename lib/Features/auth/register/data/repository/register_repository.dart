import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/auth/register/data/models/register_user_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class RegisterRepository {
  late Api api;
  RegisterRepository(this.api);

  Future<Either<Failure, RegisterUserModel>> register(
      Map<String, dynamic> data) async {
    var registerUserModel = await api.post(
      endPoint: 'auth/register',
      data: data,
    );
    return registerUserModel.fold((l) => Left(l), (r) {
    

      return Right(RegisterUserModel.fromJson(r));
    });
  }
}
