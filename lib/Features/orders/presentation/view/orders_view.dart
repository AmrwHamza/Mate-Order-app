import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/orders/presentation/view/orders_view_body.dart';
import 'package:mate_order_app/constants.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KBackgroundColor,

      appBar: mainAppBar('Orders'),
      body: const OrdersViewBody(),
    );
  }
}
