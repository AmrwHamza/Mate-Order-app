part of 'verify_cubit.dart';

sealed class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

final class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {}

class VerifyFailure extends VerifyState {
  final String error;

  const VerifyFailure(this.error);
  }
