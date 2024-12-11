import 'package:flutter/material.dart';

import 'package:mate_order_app/constants.dart';

import '../../../main home/widget/app_bar_style.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: MainAppBar('Cart'),
    );
  }
}
