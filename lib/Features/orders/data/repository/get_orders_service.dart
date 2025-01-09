import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/orders/data/models/orders_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class GetOrdersService {
  Future<Either<Failure, OrdersModel>> getOrders() async {
    final result = await Api().getWithAuth(endPoint: 'userOrders');

    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(OrdersModel.fromJsonList(r));
      },
    );
  }
}
