part of 'profile_inf_cubit.dart';

sealed class ProfileInfState extends Equatable {
  const ProfileInfState();

  @override
  List<Object> get props => [];
}

final class ProfileInfInitial extends ProfileInfState {}

final class ProfileInfFailure extends ProfileInfState {
  final String error;

  const ProfileInfFailure(this.error);
}

final class ProfileInfLoading extends ProfileInfState {}

final class ProfileGetInfSuccess extends ProfileInfState {
  final ProfileInfModel profileInfModel;

  const ProfileGetInfSuccess(this.profileInfModel);
}


final class ProfileUpdateInfSuccess extends ProfileInfState {
  final String message;

  const ProfileUpdateInfSuccess({required this.message});
}