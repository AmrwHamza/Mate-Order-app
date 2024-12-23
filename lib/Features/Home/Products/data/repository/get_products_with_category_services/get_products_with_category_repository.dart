import 'package:either_dart/either.dart';

import '../../../../../../core/utils/api_services.dart';
import '../../../../../../core/utils/error/failure.dart';
import '../../models/products_with_category_model/products_with_category/products_with_category.dart';

class GetProductsWithCategoryRepository {
  late Api api;
  GetProductsWithCategoryRepository(this.api);

  Future<Either<Failure, ProductsWithCategoryModel>> getProuducts(
      {required int pageNumber, required String category}) async {
    var result = await Api().getWithAuth(
        endPoint: 'showProducts/$category',
        queryParameters: {

  'page':pageNumber ,
});
   print('Final URL: ${api.dio.options.baseUrl}showProducts/$category?page=$pageNumber');

    return result.fold(
      (l) {
        print('API Error: ${l.message}');

        return Left(l);
      },
      (r) {
        print('API Response: $r');

        return Right(ProductsWithCategoryModel.fromJson(r));
      },
    );
  }
}
