import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/orders/data/models/orders_model.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/get_orders/get_orders_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/view/widgets/order_card_receiving.dart';
import 'package:mate_order_app/Features/orders/presentation/view/widgets/order_card_sending.dart';
import 'package:mate_order_app/Features/orders/presentation/view/widgets/order_card_waiting_accept.dart';
import 'package:mate_order_app/constants.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetOrdersCubit>().getOrders();
    return BlocConsumer<GetOrdersCubit, GetOrdersState>(
      listener: (context, state) {
        if (state is GetOrdersError) {
          Get.snackbar('Error', state.message);
        }
      },
      builder: (context, state) {
        if (state is GetOrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetOrdersSuccess) {
          return ListView.builder(
            itemCount: state.orders.orders.length,
            itemBuilder: (context, index) {
              if (state.orders.orders[index].status == 'waiting_accept') {
                return OrderCardWaitingAccept(
                  order: state.orders.orders[index],
                );
              }
              if (state.orders.orders[index].status == 'sending') {
                return OrderCardSending(
                  order: state.orders.orders[index],
                );
              }
              if (state.orders.orders[index].status == 'receiving') {
                return OrderCardReceiving(
                  order: state.orders.orders[index],
                );
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
