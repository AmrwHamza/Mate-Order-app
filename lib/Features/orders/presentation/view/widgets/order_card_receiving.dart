import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/orders/data/models/orders_model.dart';
import 'package:mate_order_app/constants.dart';

class OrderCardReceiving extends StatelessWidget {
  const OrderCardReceiving({
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Id: ${order.id}'),
              Text('Total Price: ${order.totalPrice} SYP'),
              const SizedBox(
                height: 5,
              ),
              Container(
                  padding: const EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent),
                  child: const Center(child: Text('Status: Received')))
            ],
          )
        ],
      ),
    );
  }
}
