part of 'delete_product_from_order_cubit.dart';

sealed class DeleteProductFromOrderState extends Equatable {
  const DeleteProductFromOrderState();

  @override
  List<Object> get props => [];
}

final class DeleteProductFromOrderInitial extends DeleteProductFromOrderState {}

final class DeleteProductFromOrderLoading extends DeleteProductFromOrderState {}

final class DeleteProductFromOrderError extends DeleteProductFromOrderState {
  final String message;

  const DeleteProductFromOrderError({required this.message});
}

final class DeleteProductFromOrderSuccess extends DeleteProductFromOrderState {
  final String message;

  const DeleteProductFromOrderSuccess({required this.message});


}
