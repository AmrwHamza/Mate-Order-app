part of 'update_order_cubit.dart';

sealed class UpdateOrderState extends Equatable {
  const UpdateOrderState();

  @override
  List<Object> get props => [];
}

final class UpdateOrderInitial extends UpdateOrderState {}
final class JustUpdateOrderAmount extends UpdateOrderState {
   final int oldlAmount;

  const JustUpdateOrderAmount({required this.oldlAmount});

  @override
  List<Object> get props => [oldlAmount];

}

final class UpdateOrderLoading extends UpdateOrderState {}

final class UpdateOrderError extends UpdateOrderState {
  final String message;

  const UpdateOrderError({required this.message});
}

final class UpdateOrderSuccess extends UpdateOrderState {
  final String message;

  const UpdateOrderSuccess({required this.message});
}


