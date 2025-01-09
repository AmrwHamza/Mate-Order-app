part of 'delete_order_cubit.dart';

sealed class DeleteOrderState extends Equatable {
  const DeleteOrderState();

  @override
  List<Object> get props => [];
}

final class DeleteOrderInitial extends DeleteOrderState {}

final class DeleteOrderLoading extends DeleteOrderState {}

final class DeleteOrderError extends DeleteOrderState {
  final String message;

  const DeleteOrderError({required this.message});
}

final class DeleteOrderSuccess extends DeleteOrderState {
  final String message;

  const DeleteOrderSuccess({required this.message});
}
