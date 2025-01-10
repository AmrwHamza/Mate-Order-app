part of 'notifications_cubit_cubit.dart';

sealed class NotificationsCubitState extends Equatable {
  const NotificationsCubitState();

  @override
  List<Object> get props => [];
}

final class NotificationsCubitInitial extends NotificationsCubitState {}

final class NotificationsCubitLoading extends NotificationsCubitState {}

final class NotificationsCubitError extends NotificationsCubitState {
  final String message;

  const NotificationsCubitError({required this.message});
}

final class NotificationsCubitSuccess extends NotificationsCubitState {
  final NotificationsModul notificationsModul;

  const NotificationsCubitSuccess({required this.notificationsModul});
}
