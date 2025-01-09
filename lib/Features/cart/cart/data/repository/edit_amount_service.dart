import 'package:either_dart/either.dart';
import 'package:mate_order_app/Features/cart/cart/data/models/edit_amount_modul.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class EditAmountService {
  Future<Either<Failure, EditAmountModul>> editAmount(
      {required int productId, required int newAmount}) async {
    final result = await Api().putWithAuth(
      endPoint: 'update/$productId?total_amount=$newAmount',
    );

    return result.fold(
      (l) => Left(l),
      (r) => Right(EditAmountModul.fromJson(r)),
    );
  }
}
