import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/store_products_model/store_products_model.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

import '../../../../../core/utils/api_services.dart';

class ShowStoreProductsService {
  Future<Either<Failure, StoreProductsModel>> getStoreProducts(
      {required int id, required int pageNumber}) async {
    final result = await Api()
        .getWithAuth(endPoint: 'storeProducts/$id', queryParameters: {
      'page': pageNumber,
    });

    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(StoreProductsModel.fromJson(r));
      },
    );
  }
}
