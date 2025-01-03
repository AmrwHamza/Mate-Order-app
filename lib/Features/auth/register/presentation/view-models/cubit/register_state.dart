part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterUserModel registerUserModel;

  const RegisterSuccess(this.registerUserModel);
}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure(this.error);
}

class RegisterObsecure extends RegisterState {
  final bool isObsecure;
  final IconData eyeIcon;

  const RegisterObsecure({required this.isObsecure, required this.eyeIcon});
  List<Object> get props => [isObsecure, eyeIcon];
}
