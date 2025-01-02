import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/profile/data/models/change-password/Change_Password_model.dart';
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
      print('=====Request to:====== $endpoint');
      print('=====Request data:===== $data');
      final response = await api.putWithAuth(endPoint: endpoint, data: data);
      print('=====Response for change password:===== $response');

      return response.fold(
        (failure) {
          print('Request failed: ${failure.message}');
          return Left(failure);
        },
        (json) {
          print('======Request success:====== $json');
          return Right(ChangePasswordModel.fromJson(json));
        },
      );
    } catch (e) {
      print('====!!!!===Unexpected error:===!!!!==== $e');
      return Left(UnknownFailure('==Unexpected error occurred=='));
    }
  }
}
