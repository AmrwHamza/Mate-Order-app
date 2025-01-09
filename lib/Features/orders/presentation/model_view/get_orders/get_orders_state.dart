part of 'get_orders_cubit.dart';

sealed class GetOrdersState extends Equatable {
  const GetOrdersState();

  @override
  List<Object> get props => [];
}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersLoading extends GetOrdersState {}

final class GetOrdersError extends GetOrdersState {
  final String message;

  const GetOrdersError({required this.message});
}

final class GetOrdersSuccess extends GetOrdersState {
 final OrdersModel orders;

  const GetOrdersSuccess({required this.orders});
}
