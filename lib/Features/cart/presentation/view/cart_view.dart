import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/cart/presentation/model_view/cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/presentation/view/cart_view_body.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CartCubit>().getCartProducts();
        return true;
      },
      child: Scaffold(
        appBar: mainAppBar('Cart'),
        body: const CartViewBody(),
      ),
    );
  }
}
