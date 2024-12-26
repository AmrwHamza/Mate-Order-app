import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/search_products_model/search_products_model.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

import '../../../../../../core/utils/api_services.dart';

class SearchProductsService {
  Future<Either<Failure, SearchProductsModel>> searchProducts(String q) async {
    var result = await Api()
        .getWithAuth(endPoint: 'searchProduct', queryParameters: {'name': q});

    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(SearchProductsModel.fromJson(r));
      },
    );
  }
}
