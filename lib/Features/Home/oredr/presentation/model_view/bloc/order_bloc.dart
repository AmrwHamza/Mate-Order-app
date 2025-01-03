
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';
import 'package:mate_order_app/Features/Home/locations/data/models/address_list_model.dart';
import 'package:mate_order_app/Features/Home/oredr/data/repository/add_order_services.dart';


part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  int amount = 0;
  dynamic price = 0;
  Address? address;
  Product? product;

  OrderBloc([this.product]) : super(OrderInitial()) {
    on<ChangeAmountEvent>(onChanfeAmount);
    on<ChooseLocationEvent>(onChooseLocation);
    on<AddOrderEvent>(onaddOrder);
  }

  void onChanfeAmount(ChangeAmountEvent event, Emitter<OrderState> emit) {
    if (amount + event.changeAmount < 0 ||
        amount + event.changeAmount > product!.amount!) {
      if (amount + event.changeAmount < 0) {
        amount = 0;
        price = 0;
      }
      if (amount + event.changeAmount > product!.amount!) {
        amount = product!.amount!;
        price = product!.amount! * product!.price;
      }
      emit(ChangedAmount(amount: amount, price: price, address: address));
    } else {
      amount += event.changeAmount;
      price = amount * product!.price;
      emit(ChangedAmount(
        amount: amount,
        price: price,
        address: address,
      ));
    }
  }

  void onChooseLocation(ChooseLocationEvent event, Emitter<OrderState> emit) {
    address = event.address;

    emit(ChangedAmount(price: price, amount: amount, address: address));
  }

  void onaddOrder(AddOrderEvent event, Emitter<OrderState> emit) async {
    emit(AddOrderLoading());
    final result = await AddOrderServices().addOrder(
        productId: product!.id!, locationId: address!.id, amount: amount);

    result.fold((l) => emit(AddOrderError(message: l.message)), (r) {
      emit(AddOrderSuccess(message: r.message ?? 'order added successfully'));
    
    });
  }
}
