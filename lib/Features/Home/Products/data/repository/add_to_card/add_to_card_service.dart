import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Home/map/data/models/add_address_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

import '../../models/add_to_cart/add_to_cart_model.dart';

class AddToCardService {
  Future<Either<Failure, AddToCartModel>> addToCard(
      {required int productID}) async {
    var result =
        await Api().postWithAuth(endPoint: 'create/$productID', data: {});

    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(AddToCartModel.fromJson(r));
      },
    );
  }
}
