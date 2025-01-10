import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/orders/data/models/products_in_order_model.dart';
import 'package:mate_order_app/Features/orders/data/repository/update_order_service.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(
    this.productInCart,
    this.orderId,
    this.newAmount,
    this.price,
    this.newPrice,
    this.oldAmount,
  ) : super(UpdateOrderInitial());

  final ProductInCart productInCart;
  int newAmount;
  final int orderId;
  final int oldAmount;

  final int? price;
  int? newPrice;
  void changeAmount({required int changeAmount}) {
    if (newAmount + changeAmount < 1 ||
        newAmount + changeAmount > productInCart.amount!) {
      if (newAmount + changeAmount < 1) {
        newAmount = 1;
        newPrice = newAmount * price!;
      }
      if (newAmount + changeAmount > productInCart.amount!) {
        newAmount = productInCart.amount!;
        newPrice = newAmount * price!;
      }
    } else {
      newAmount += changeAmount;
      newPrice = newAmount * price!;
    }

    emit(JustUpdateOrderAmount(oldlAmount: newAmount));
  }

  Future<void> confirmNewAmount() async {
    emit(UpdateOrderLoading());

    final int a = oldAmount - newAmount;
    final result = await UpdateOrderService().updateOrder(
        orderId: orderId,
        productId: productInCart.id!,
        totalAmount: a,
        newAmount: newAmount);

    result.fold(
      (l) => emit(UpdateOrderError(message: l.message)),
      (r) => emit(UpdateOrderSuccess(message: r.message ?? 'Done')),
    );
  }
}
