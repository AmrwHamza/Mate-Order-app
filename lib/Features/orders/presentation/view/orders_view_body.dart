import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
    return LiquidPullToRefresh(
      height: 60,
      showChildOpacityTransition: false,
      backgroundColor: Colors.white,
      color: kPrimaryColor4,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: () async {
        await context.read<GetOrdersCubit>().getOrders();
      },
      child: BlocConsumer<GetOrdersCubit, GetOrdersState>(
        listener: (context, state) {
          if (state is GetOrdersError) {
            // Get.snackbar('Error', state.message);
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
          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: Text(
                    'No orders available',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
