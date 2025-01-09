part of 'get_order_products_cubit.dart';

sealed class GetOrderProductsState extends Equatable {
  const GetOrderProductsState();

  @override
  List<Object> get props => [];
}

final class GetOrderProductsInitial extends GetOrderProductsState {}

final class GetOrderProductsLoading extends GetOrderProductsState {}

final class GetOrderProductsError extends GetOrderProductsState {
  final String error;

  const GetOrderProductsError({required this.error});
}

final class GetOrderProductsSuccess extends GetOrderProductsState {
  final ProductsInOrderModel productsInOrderModel;

  const GetOrderProductsSuccess({required this.productsInOrderModel});
}
