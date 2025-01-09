import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/orders/presentation/view/edit_order_view/edit_order_view_body.dart';

class EditOrderView extends StatelessWidget {
  const EditOrderView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Edit Order'),
      body: EditOrderViewBody(
        id: id,
      ),
    );
  }
}
