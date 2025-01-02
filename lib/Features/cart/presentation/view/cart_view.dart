import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/cart/presentation/view/cart_view_body.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Cart'),
      body: CartViewBody(),
    );
  }
}
