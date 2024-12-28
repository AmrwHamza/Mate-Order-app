part of 'order_bloc.dart';

abstract class OrderEvent {}

class ChangeAmountEvent extends OrderEvent {
  final int changeAmount;

  ChangeAmountEvent({required this.changeAmount});
}
