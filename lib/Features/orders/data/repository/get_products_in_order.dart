import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/orders/data/models/products_in_order_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class GetProductsInOrder {
  Future<Either<Failure, ProductsInOrderModel>> getProductsInOrder(
      {required int orderId}) async {
    final result = await Api().getWithAuth(endPoint: 'editOrder/$orderId');

    return result.fold(
      (l) => Left(l),
      (r) => Right(ProductsInOrderModel.fromJson(r)),
    );
  }
}
