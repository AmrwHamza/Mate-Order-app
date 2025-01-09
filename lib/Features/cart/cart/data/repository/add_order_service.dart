import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Home/map/data/models/add_address_model.dart';
import 'package:mate_order_app/Features/cart/cart/data/models/add_order_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class AddOrderService {
  Future<Either<Failure, AddOrderModel>> addOrder(
      {required int locattonId}) async {
    final result =
        await Api().postWithAuth(endPoint: 'addOrder/$locattonId', data: {});

    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(AddOrderModel.fromJson(r));
      },
    );
  }
}
