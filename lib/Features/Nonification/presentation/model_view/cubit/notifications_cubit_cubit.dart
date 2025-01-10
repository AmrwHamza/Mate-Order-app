import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Nonification/data/models/notifications_modul.dart';
import 'package:mate_order_app/Features/Nonification/data/repository/get_notifications_service.dart';

part 'notifications_cubit_state.dart';

class NotificationsCubit extends Cubit<NotificationsCubitState> {
  NotificationsCubit() : super(NotificationsCubitInitial());

  Future<void> getNotifications() async {
    emit(NotificationsCubitLoading());
    final result = await GetNotificationsService().getNotifications();

    result.fold(
      (l) => emit(NotificationsCubitError(message: l.message)),
      (r) => emit(NotificationsCubitSuccess(notificationsModul: r)),
    );
  }
}
