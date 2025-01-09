import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/orders/data/models/orders_model.dart';
import 'package:mate_order_app/Features/orders/data/repository/get_orders_service.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());

  Future<void> getOrders() async {
    emit(GetOrdersLoading());

    final result = await GetOrdersService().getOrders();

    result.fold(
      (l) {
        emit(GetOrdersError(message: l.message));
      },
      (r) {
        emit(GetOrdersSuccess(orders: r));
      },
    );
  }
}
