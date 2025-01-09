import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/delete_product_from_order_service.dart';

part 'delete_product_from_order_state.dart';

class DeleteProductFromOrderCubit extends Cubit<DeleteProductFromOrderState> {
  DeleteProductFromOrderCubit() : super(DeleteProductFromOrderInitial());

  Future<void> delete({required int orderId, required int productId}) async {
    emit(DeleteProductFromOrderLoading());

    final result = await DeleteProductFromOrderService()
        .delete(orderId: orderId, productId: productId);

    result.fold(
      (l) => emit(DeleteProductFromOrderError(message: l.message)),
      (r) => emit(DeleteProductFromOrderSuccess(message: r.message ?? 'Done')),
    );
  }
}
