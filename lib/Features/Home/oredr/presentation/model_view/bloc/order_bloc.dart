import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  int amount = 0;
  dynamic price = 0;
  final Product product;

  OrderBloc({required this.product}) : super(OrderInitial()) {
    on<ChangeAmountEvent>(onChanfeAmount);
  }

  void onChanfeAmount(ChangeAmountEvent event, Emitter<OrderState> emit) {
    if (amount + event.changeAmount < 0 ||
        amount + event.changeAmount > product.amount!) {
      if (amount + event.changeAmount < 0) {
        amount = 0;
        price = 0;
      }
      if (amount + event.changeAmount > product.amount!) {
        amount = product.amount!;
        price = product.amount! * product.price;
      }
      emit(ErrorChange(
          message: "You can't decrease below 0", amount: amount, price: price));
    } else if (amount >= product.amount! && event.changeAmount == 1) {
      emit(ErrorChange(
          message: "you can't add more ", amount: amount, price: price));
    } else {
      amount += event.changeAmount;
      price = amount * product.price;
      emit(ChangedAmount(
        amount: amount,
        price: price,
      ));
    }
  }
}
