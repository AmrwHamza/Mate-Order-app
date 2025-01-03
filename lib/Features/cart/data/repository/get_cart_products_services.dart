import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/cart/data/models/cart_products_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class GetCartProductsServices {
  Future<Either<Failure, CartProductsModel>> getCartProducts() async {
    final result = await Api().getWithAuth(endPoint: 'show');
    return result.fold(
      (l) => Left(l),
      (r) => Right(CartProductsModel.fromJson(r)),
    );
  }
}
