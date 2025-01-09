import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/delete_order_service.dart';

part 'delete_order_state.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderState> {
  DeleteOrderCubit() : super(DeleteOrderInitial());

  Future<void> deleteOrder({required int orderId}) async {
    emit(DeleteOrderLoading());
    final result = await DeleteOrderService().deleteOrder(id: orderId);
    result.fold(
      (l) => emit(DeleteOrderError(message: l.message)),
      (r) => emit(DeleteOrderSuccess(message: r.message ?? 'Done')),
    );
  }
}
