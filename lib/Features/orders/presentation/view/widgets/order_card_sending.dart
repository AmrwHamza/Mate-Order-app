import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/orders/data/models/orders_model.dart';
import 'package:mate_order_app/constants.dart';

class OrderCardSending extends StatelessWidget {
  const OrderCardSending({
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
              Row(
                children: [
                  Text('Total Price: ${order.totalPrice} '),
                  const Text('SYP').tr()
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
                      color: kPrimaryColor7),
                  child: Center(child: const Text('Status: Sending').tr()))
            ],
          )
        ],
      ),
    );
  }
}
