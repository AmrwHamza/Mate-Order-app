part of 'logout_cubit.dart';

abstract class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String error;

  LogoutFailure({required this.error});
}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}
