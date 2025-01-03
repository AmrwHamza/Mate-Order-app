import 'package:either_dart/either.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/search_stores_model/search_stores_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class SearchStoresService {
  Future<Either<Failure, SearchStoresModel>> searchStores(
      {required String q}) async {
    final result = await Api()
        .getWithAuth(endPoint: 'searchStore', queryParameters: {'name': q});

    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(SearchStoresModel.fromJson(r));
      },
    );
  }
}
