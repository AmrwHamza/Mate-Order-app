// ignore: file_names
// ignore: file_names
import 'package:either_dart/either.dart';
import 'package:mate_order_app/Features/cart/cart/data/models/delete_product_of_cart_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class Deleteproductofcartservice {
  Future<Either<Failure, DeleteProductOfCartModel>> deleteFromCart(
      {required int id}) async {
    final result = await Api().deleteWithAuth(endPoint: 'delete/$id', data: {});

    return result.fold(
      (l) => Left(l),
      (r) => Right(DeleteProductOfCartModel.fromJson(r)),
    );
  }
}
