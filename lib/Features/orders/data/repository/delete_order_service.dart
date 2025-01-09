import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/orders/data/models/delete_order_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class DeleteOrderService {
  Future<Either<Failure, DeleteOrderModel>> deleteOrder(
      {required int id}) async {
    final result =
        await Api().deleteWithAuth(endPoint: 'deleteOrder/$id', data: {});

    return result.fold(
      (l) => Left(l),
      (r) => Right(DeleteOrderModel.fromJson(r)),
    );
  }
}
