part of 'order_bloc.dart';

abstract class OrderEvent {}

class ChangeAmountEvent extends OrderEvent {
  final int changeAmount;

  ChangeAmountEvent({required this.changeAmount});
}

class ChooseLocationEvent extends OrderEvent {
  final Address address;

  ChooseLocationEvent(this.address);
}

class AddOrderEvent extends OrderEvent {}
