import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/orders/data/models/delete_product_form_order_modul.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

import '../../../../core/utils/error/failure.dart';

class DeleteProductFromOrderService {
  Future<Either<Failure, DeleteProductFromOrderModul>> delete(
      {required int orderId, required int productId}) async {
    final result = await Api().deleteWithAuth(
        endPoint: 'deleteFromOrder/$orderId/$productId', data: {});

    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(DeleteProductFromOrderModul.fromJson(r));
      },
    );
  }
}
