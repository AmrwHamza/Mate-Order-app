import 'package:dartz/dartz.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

import '../../../../../core/utils/api_services.dart';
import '../models/stores_model/stores_model.dart';

class ShowStoresService {
  final Api api;

  ShowStoresService({required this.api});

  Future<Either<Failure, StoresModel>> getStores({required int page}) async {
    final result = await api.getWithAuth(endPoint: 'showStores?page=$page');
    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(StoresModel.fromJson(r));
      },
    );
  }
}
