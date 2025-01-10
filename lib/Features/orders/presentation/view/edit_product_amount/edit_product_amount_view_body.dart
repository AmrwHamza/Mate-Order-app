import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/orders/data/models/products_in_order_model.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/update_order/update_order_cubit.dart';

import '../../../../../constants.dart';
import '../../model_view/GetOrderProducts/get_order_products_cubit.dart';

class EditProductAmountViewBody extends StatelessWidget {
  const EditProductAmountViewBody(
      {super.key,
      required this.productInCart,
      required this.totalAmount,
      required this.orderId});
  final ProductInCart productInCart;
  final int totalAmount;
  final int orderId;
  @override
  Widget build(BuildContext context) {
    final int price = productInCart.price!;
    return BlocProvider(
      create: (context) => UpdateOrderCubit(
          productInCart, orderId, totalAmount, price, price, totalAmount),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                photoInDetails(),
                name(),
                const SizedBox(height: 10),
                const Divider(
                  color: kPrimaryColor1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            // offset: Offset(3, 2),
                            color: kPrimaryColor7)
                      ],
                      color: kPrimaryColor8,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(7),
                    child: const Text(
                      'Details',
                      style: TextStyle(
                        color: kPrimaryColor1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      theCategory(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('Max').tr(),
                          Text(': ${productInCart.amount}'),
                        ],
                      ),
                      BlocBuilder<UpdateOrderCubit, UpdateOrderState>(
                        builder: (context, state) {
                          context
                              .read<UpdateOrderCubit>()
                              .changeAmount(changeAmount: 0);

                          return Row(
                            children: [
                              Text(
                                  'Total Price: ${context.read<UpdateOrderCubit>().newPrice} '),
                              const Text('SYP').tr()
                            ],
                          );
                        },
                      ),
                      const Text('Amount:'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ButtonInEditOrderAmount(
                            changeAmount: -10,
                            icon: Text(
                              '-10',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ButtonInEditOrderAmount(
                            changeAmount: -1,
                            icon: Text(
                              '-1',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          BlocBuilder<UpdateOrderCubit, UpdateOrderState>(
                            builder: (context, state) {
                              return Text(
                                context
                                    .read<UpdateOrderCubit>()
                                    .newAmount
                                    .toString(), ///////
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ButtonInEditOrderAmount(
                            changeAmount: 1,
                            icon: Text(
                              '+1',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            color: kPrimaryColor6,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const ButtonInEditOrderAmount(
                            changeAmount: 10,
                            icon: Text(
                              '+10',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            color: kPrimaryColor6,
                          ),
                        ],
                      ),
                      Center(
                        child: BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
                          listener: (context, state) {
                            if (state is UpdateOrderSuccess) {
                              Get.snackbar('done', 'perfect');

                              context
                                  .read<GetOrderProductsCubit>()
                                  .getProducts(orderId: orderId);

                              Navigator.pop(context);
                            }
                            if (state is UpdateOrderError) {
                              Get.snackbar('Error', state.message);
                            }
                          },
                          builder: (context, state) {
                            if (state is UpdateOrderLoading) {
                              return const CircularProgressIndicator();
                            }
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<UpdateOrderCubit>()
                                    .confirmNewAmount();
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(kPrimaryColor8)),
                              child: const Text(
                                'Confirm',
                                style: TextStyle(color: kPrimaryColor1),
                              ).tr(),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: kPrimaryColor1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center name() {
    return Center(
      child: Text(
        productInCart.name ?? 'no name',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  AspectRatio photoInDetails() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Hero(
        tag:
            '${productInCart.id}${productInCart.imagePath}${productInCart.createdAt}',
        child: CachedNetworkImage(
          imageUrl: "$baseurlImg"
              "${productInCart.imagePath!}",
          placeholder: (context, url) => const Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 60, width: 60, child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          // fit: BoxFit.contain,
        ),
      ),
    );
  }

  Text theCategory() => Text(
        'Category: ${productInCart.category} ',
        style: const TextStyle(fontSize: 16),
      );
}

class ButtonInEditOrderAmount extends StatelessWidget {
  const ButtonInEditOrderAmount({
    super.key,
    required this.changeAmount,
    required this.icon,
    required this.color,
  });
  final int changeAmount;
  final Widget icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context
            .read<UpdateOrderCubit>()
            .changeAmount(changeAmount: changeAmount);
      },
      icon: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
