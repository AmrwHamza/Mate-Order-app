import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/view/widgets/cart_product_card.dart';

import '../../../../../constants.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      height: 60,
      showChildOpacityTransition: false,
      backgroundColor: Colors.white,
      color: kPrimaryColor4,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: () async {
        context.read<CartCubit>().getCartProducts();
      },
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartError) {
            Get.snackbar('Error', state.message);
          }
        },
        builder: (context, state) {
          if (state is CartInitial) {
            context.read<CartCubit>().getCartProducts();
          }
          if (state is CartSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: state.cartProducts.data?.length,
                itemBuilder: (context, index) {
                  if (index == state.cartProducts.data!.length - 1) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartProductCard(
                          product:
                              state.cartProducts.data![index].productInCart!),
                    );
                  }
                  return CartProductCard(
                      product: state.cartProducts.data![index].productInCart!);
                },
              ),
            );
          } else if (state is CartLoading || state is CartInitial) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          } else {
            return ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: Text(
                      'No products in the cart',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
