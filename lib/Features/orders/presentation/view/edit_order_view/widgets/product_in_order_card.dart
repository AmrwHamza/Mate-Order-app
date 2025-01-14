import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/orders/data/models/products_in_order_model.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/delete_product_from_order.dart/delete_product_from_order_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/view/edit_product_amount/edit_product_amount_view.dart';

import '../../../../../../constants.dart';
import '../../../model_view/GetOrderProducts/get_order_products_cubit.dart';

class ProductInOrderCard extends StatelessWidget {
  const ProductInOrderCard({
    super.key,
    required this.productInCart,
    required this.totalAmount,
    required this.orderId,
  });
  final ProductInCart productInCart;
  final int totalAmount;
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 120,
      decoration: BoxDecoration(
          color: kPrimaryColor8, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            img(),
            div(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name(context),
                Row(
                  children: [
                    const Text('amount').tr(),
                    Text(':$totalAmount'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(
                            () => EditProductAmountView(
                                productInCart: productInCart,
                                totalAmount: totalAmount,
                                orderId: orderId),
                          );
                        },
                        child: const Icon(Icons.edit)),
                    const SizedBox(
                      width: 20,
                    ),
                    DeleteProductFromOrderButton(
                      orderId: orderId,
                      productId: productInCart.id!,
                    ), //                                child: const Icon(Icons.edit));
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox name(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Row(
        children: [
          const Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).tr(),
          Text(
            ': ${productInCart.name}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  VerticalDivider div() {
    return const VerticalDivider(
      color: kPrimaryColor10,
      thickness: 5,
      indent: 5,
      endIndent: 5,
    );
  }

  AspectRatio img() {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: "$baseurlImg"
              "${productInCart.imagePath!}",
          placeholder: (context, url) => const Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 60, width: 60, child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class DeleteProductFromOrderButton extends StatelessWidget {
  const DeleteProductFromOrderButton({
    super.key,
    required this.orderId,
    required this.productId,
  });
  final int orderId;
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductFromOrderCubit,
        DeleteProductFromOrderState>(
      listener: (context, state) {
        if (state is DeleteProductFromOrderError) {
          Get.snackbar('Error', state.message);
        }
        if (state is DeleteProductFromOrderSuccess) {
          context.read<GetOrderProductsCubit>().getProducts(orderId: orderId);
        }
      },
      builder: (context, state) {
        if (state is DeleteProductFromOrderLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ElevatedButton(
            onPressed: () {
              context
                  .read<DeleteProductFromOrderCubit>()
                  .delete(orderId: orderId, productId: productId);
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
            child: const Text('Delete').tr());
      },
    );
  }
}
