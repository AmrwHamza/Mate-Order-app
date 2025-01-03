part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginUserModel loginUserModel;

  const LoginSuccess({required this.loginUserModel});
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure({required this.error});
}

class LoginObsecure extends LoginState  {
  final bool isObsecure;
  final IconData eyeIcon;

  const LoginObsecure({required this.isObsecure, required this.eyeIcon});
  @override
  List<Object> get props => [isObsecure, eyeIcon];
}
