import 'package:either_dart/either.dart';

import '../../../../../../core/utils/api_services.dart';
import '../../../../../../core/utils/error/failure.dart';
import '../../models/products_with_category_model/products_with_category/products_with_category.dart';

class GetProductsWithCategoryRepository {
  late Api api;
  GetProductsWithCategoryRepository(this.api);

  Future<Either<Failure, ProductsWithCategoryModel>> getProuducts(
      {required int pageNumber, required String category}) async {
    final result = await Api().getWithAuth(
        endPoint: 'showProducts/$category',
        queryParameters: {

  'page':pageNumber ,
});

    return result.fold(
      (l) {

        return Left(l);
      },
      (r) {

        return Right(ProductsWithCategoryModel.fromJson(r));
      },
    );
  }
}
