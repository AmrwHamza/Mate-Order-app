import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/favorits/data/models/favorites_modul.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class GetFavoritesService {
  Future<Either<Failure, FavoritsModul>> getFavorits() async {
    final result = await Api().getWithAuth(endPoint: 'showFav');
    return result.fold(
      (l) => Left(l),
      (r) => Right(FavoritsModul.fromJson(r)),
    );
  }
}
