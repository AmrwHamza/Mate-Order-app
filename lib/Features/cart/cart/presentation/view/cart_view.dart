import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/view/locations_view.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/view/cart_view_body.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/constants.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CartCubit>().getCartProducts();
        return true;
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: mainAppBar('Cart'),
            body: const CartViewBody(),
            floatingActionButton: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LocationsView();
                    },
                  ));
                },
                backgroundColor: kPrimaryColor9,
                isExtended: true,
                mini: false,
                child: const Text('Choose Location'),
              ),
            ),
          );
        },
      ),
    );
  }
}
