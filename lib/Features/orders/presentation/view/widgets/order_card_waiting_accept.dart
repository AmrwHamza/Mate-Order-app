import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/orders/data/models/orders_model.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/delete_order/delete_order_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/get_orders/get_orders_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/view/edit_order_view/edit_order_view.dart';
import 'package:mate_order_app/constants.dart';

class OrderCardWaitingAccept extends StatelessWidget {
  const OrderCardWaitingAccept({
    super.key,
    required this.order,
  });
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 100,
      decoration: BoxDecoration(
          color: kPrimaryColor5, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Id: ${order.id}'),
              Row(
                children: [
                  Text('Total Price: ${order.totalPrice} '),
                  const Text('SYP').tr(),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  padding: const EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryColor10),
                  child:
                      Center(child: const Text('Status: Waiting accept').tr()))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EditOrderView(
                      order: order,
                    );
                  },
                ));
              },
              child: const Text('Edit')),
          DeleteOrderButton(
            id: order.id,
          )
        ],
      ),
    );
  }
}

class DeleteOrderButton extends StatelessWidget {
  const DeleteOrderButton({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteOrderCubit(),
      child: BlocConsumer<DeleteOrderCubit, DeleteOrderState>(
        listener: (context, state) {
          if (state is DeleteOrderSuccess) {
            context.read<GetOrdersCubit>().getOrders();
          }
        },
        builder: (context, state) {
          if (state is DeleteOrderLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ElevatedButton(
              onPressed: () {
                context.read<DeleteOrderCubit>().deleteOrder(orderId: id);
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
              child: const Text('Delete').tr());
        },
      ),
    );
  }
}
