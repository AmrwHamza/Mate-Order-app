import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/profile/data/models/change-password/change_password_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class ChangePasswordService {
  late Api api;

  ChangePasswordService(this.api);
  Future<Either<Failure, ChangePasswordModel>> changePassword({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await api.putWithAuth(endPoint: endpoint, data: data);

      return response.fold(
        (failure) {
          return Left(failure);
        },
        (json) {
          return Right(ChangePasswordModel.fromJson(json));
        },
      );
    } catch (e) {
      return const Left(UnknownFailure('==Unexpected error occurred=='));
    }
  }
}
