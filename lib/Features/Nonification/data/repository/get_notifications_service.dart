import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Nonification/data/models/notifications_modul.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class GetNotificationsService {
  Future<Either<Failure, NotificationsModul>> getNotifications() async {
    final result = await Api().getWithAuth(endPoint: 'notificationsUser');

    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(NotificationsModul.fromJson(r));
      },
    );
  }
}
