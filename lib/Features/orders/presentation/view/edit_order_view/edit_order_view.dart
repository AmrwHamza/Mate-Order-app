import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/orders/presentation/view/edit_order_view/edit_order_view_body.dart';
import 'package:mate_order_app/constants.dart';

import '../../../data/models/orders_model.dart';

class EditOrderView extends StatelessWidget {
  const EditOrderView({
    super.key,
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: KBackgroundColor,

      appBar: mainAppBar('Edit Order'),
      body: EditOrderViewBody(
        id: order.id,
      ),
    );
  }
}
