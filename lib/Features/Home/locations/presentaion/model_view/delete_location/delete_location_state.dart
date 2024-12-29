part of 'delete_location_cubit.dart';

sealed class DeleteLocationState extends Equatable {
  const DeleteLocationState();

  @override
  List<Object> get props => [];
}

final class DeleteLocationInitial extends DeleteLocationState {}

final class DeleteLocationLoading extends DeleteLocationState {}

final class DeleteLocationSuccess extends DeleteLocationState {
  final String message;

  const DeleteLocationSuccess({required this.message});
}

final class DeleteLocationError extends DeleteLocationState {
  final String message;

  const DeleteLocationError({required this.message});
}
