import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Home/oredr/data/models/add_order_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class AddOrderServices {
  Future<Either<Failure, AddOrderModel>> addOrder(
      {required int productId,
      required int locationId,
      required int amount}) async {
    var result = await Api().postWithAuth(
        endPoint: 'addOrder/${productId}/${locationId}',
        data: {"total_amount": amount});

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
