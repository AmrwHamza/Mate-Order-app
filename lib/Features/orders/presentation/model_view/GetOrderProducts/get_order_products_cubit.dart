import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/orders/data/repository/get_products_in_order.dart';

import '../../../data/models/products_in_order_model.dart';

part 'get_order_products_state.dart';

class GetOrderProductsCubit extends Cubit<GetOrderProductsState> {
  GetOrderProductsCubit() : super(GetOrderProductsInitial());

  Future<void> getProducts({required int orderId}) async {
    emit(GetOrderProductsLoading());
    final result =
        await GetProductsInOrder().getProductsInOrder(orderId: orderId);
    result.fold(
      (l) => emit(GetOrderProductsError(error: l.message)),
      (r) => emit(GetOrderProductsSuccess(productsInOrderModel: r)),
    );
  }
}
