import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/view/store_products/store_products_body.dart';

import '../../../../../../constants.dart';
import '../../../../../main home/widget/app_bar_style.dart';

class StoreProductsView extends StatelessWidget {
  const StoreProductsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: mainAppBar('Products'),
      body: SafeArea(
        child: StoreProductsBody(id: id),
      ),
    );
  }
}
