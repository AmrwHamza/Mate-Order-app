// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/cart/data/models/cart_products_model.dart';
import 'package:mate_order_app/Features/cart/data/repository/get_cart_products_services.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCartProducts() async {
    if (isClosed) {
      return;
    }
    emit(CartLoading());
    final result = await GetCartProductsServices().getCartProducts();
 if (isClosed) {
      return;
    }
    result.fold((l) => emit(CartError(message: l.message)), (r) {
      emit(CartSuccess(cartProducts: r));
    });
  }

}
