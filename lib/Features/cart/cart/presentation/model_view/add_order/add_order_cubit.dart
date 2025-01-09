import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/cart/cart/data/repository/add_order_service.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(AddOrderInitial());

  Future<void> addOrder({required int addressId}) async {
    emit(AddOrderLoading());
    final result = await AddOrderService().addOrder(locattonId: addressId);
    result.fold(
      (l) {
        emit(AddOrderError(message: l.message));
      },
      (r) {
        emit(AddOrderSuccess(message: r.message!));
      },
    );
  }
}
