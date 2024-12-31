part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

final class OrderInitial extends OrderState {}

final class ErrorChange extends OrderState {
  final String message;
  final int amount;
  final dynamic price;
  const ErrorChange(
      {required this.amount, required this.price, required this.message});
}

final class ChangedAmount extends OrderState {
  final int amount;
  final dynamic price;
  final Address? address;

  const ChangedAmount(
      {required this.price, required this.amount, this.address});

  @override
  List<Object?> get props => [amount, price, address];
}

final class AddOrderLoading extends OrderState {}

final class AddOrderSuccess extends OrderState {
  final String message;

  const AddOrderSuccess({required this.message});
}

final class AddOrderError extends OrderState {
  final String message;

  const AddOrderError({required this.message});
}
