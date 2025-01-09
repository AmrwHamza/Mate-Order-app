import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/orders/data/models/products_in_order_model.dart';

import 'edit_product_amount_view_body.dart';

class EditProductAmountView extends StatelessWidget {
  const EditProductAmountView({super.key, required this.productInCart, required this.totalAmount, required this.orderId});
 final ProductInCart productInCart;
  final int totalAmount;
  final int orderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Edit Amount'),
      body: EditProductAmountViewBody(productInCart: productInCart, totalAmount: totalAmount, orderId: orderId),
    );
  }
}
