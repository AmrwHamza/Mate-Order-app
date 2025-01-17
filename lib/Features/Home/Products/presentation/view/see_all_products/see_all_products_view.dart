import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../main home/widget/app_bar_style.dart';
import 'see_all_products_body.dart';

class SeeAllProductsView extends StatelessWidget {
  const SeeAllProductsView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KBackgroundColor,
      appBar: mainAppBar('Products'),
      body: SafeArea(
          child: SeeAllProductsBody.SeeAllProductsBody(
              categoryName: categoryName)),
    );
  }
}
