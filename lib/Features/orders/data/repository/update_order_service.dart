import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/orders/data/models/update_order_modul.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class UpdateOrderService {
  Future<Either<Failure, UpdateOrderModul>> updateOrder(
      {required int orderId,
      required int productId,
      required int totalAmount,
      required int newAmount}) async {
    final result = await Api().putWithAuth(
        endPoint:
            'updateOrder/$orderId/$productId?total_amount=$totalAmount&new_amount=$newAmount');

    return result.fold(
      (l) => Left(l),
      (r) => Right(UpdateOrderModul.fromJson(r)),
    );
  }
}
