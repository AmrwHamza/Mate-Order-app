import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Orders'),
      body: Container(),
    );
  }
}
