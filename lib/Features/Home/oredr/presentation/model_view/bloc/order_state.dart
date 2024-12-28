part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class ErrorChange extends OrderState {
  final String message;
 final int amount;
  final dynamic price;
  const ErrorChange({required this.amount,required this.price,  required this.message});
}

final class ChangedAmount extends OrderState {
  final int amount;
  final dynamic price;
  const ChangedAmount({required this.price, required this.amount});
  @override
  List<Object> get props => [amount,price];
}
