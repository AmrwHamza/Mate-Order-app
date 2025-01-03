import 'package:either_dart/either.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/fav/add_to_fav.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/fav/dis_fav_model.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

import '../../../../../../core/utils/api_services.dart';

class FavoriteService {
  late Api api;
  FavoriteService({required this.api});

  Future<Either<Failure, AddToFavModel>> addToFav({required String id}) async {
    final result = await api.postWithAuth(endPoint: 'addFav/$id', data: {});
    return result.fold(
      (left) => Left(left),
      (right) {
        return Right(AddToFavModel.fromJson(right));
      },
    );
  }

  Future<Either<Failure, DisFavModel>> disFav({required String id}) async {
    final result = await api.postWithAuth(endPoint: 'disFav/$id', data: {});

    return result.fold(
      (left) => Left(left),
      (right) {
        return Right(DisFavModel.fromJson(right));
      },
    );
  }
}
