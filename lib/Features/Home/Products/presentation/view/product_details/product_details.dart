import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/model_view/add_to_cart/add_to_cart_cubit.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/fav_icon/fav_icon.dart';

import '../../../../../../constants.dart';
import '../../../../../main home/widget/app_bar_style.dart';
import '../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';

class ProductDetails extends StatelessWidget {
  final int numberOfproducts = 1;
  final Product product;

  const ProductDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: mainAppBar('Product Details'),
      body: Padding(
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
                      Row(
                        children: [
                          const Text(
                            'Owner',
                            style: TextStyle(fontSize: 16),
                          ).tr(),
                          theOwner(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            'The Price',
                            style: TextStyle(fontSize: 16),
                          ).tr(),
                          thePrice(),
                          const Text(
                            'SYP',
                            style: TextStyle(fontSize: 16),
                          ).tr()
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            'amount',
                            style: TextStyle(fontSize: 16),
                          ).tr(),
                          amount(),
                        ],
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
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kPrimaryColor7),
                        child: FavIcon(product: product)),
                    const SizedBox(
                      width: 10,
                    ),
                    AddToCartButton(product: product),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text amount() {
    return Text(
      ': ${product.amount}',
      style: const TextStyle(fontSize: 16),
    );
  }

  Text theOwner() => Text(
        ':${product.owner} ',
        style: const TextStyle(fontSize: 16),
      ).tr();

  Text thePrice() {
    return Text(
      ': ${product.price} ',
      style: const TextStyle(fontSize: 16),
    );
  }

  Center name() {
    return Center(
      child: Text(
        product.name ?? 'no name',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  AspectRatio photoInDetails() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Hero(
        tag: '${product.id}${product.imagePath}${product.createdAt}',
        child: CachedNetworkImage(
          imageUrl: "$baseurlImg"
              "${product.imagePath!}",
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
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(),
      child: BlocConsumer<AddToCartCubit, AddToCartState>(
        listener: (context, state) {
          if (state is AddToCartError &&
              state.message.contains('You Added It Before')) {
            Get.snackbar('You Added It Before', '');
          } else if (state is AddToCartError) {
            Get.snackbar('Error', state.message);
          }

          if (state is AddToCartSuccess) {
            Get.snackbar('Success', state.message);
          }
        },
        builder: (context, state) {
          if (state is AddToCartSuccess) {
            return ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kPrimaryColor7)),
              onPressed: () {
                // context.read<AddToCartCubit>().addToCard(id: product.id!);
              },
              child: const Text(
                'Done ✅',
                style: TextStyle(color: Colors.black),
              ).tr(),
            );
          }
          if (state is AddToCartError &&
              state.message.contains('You Added It Before')) {
            return ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kPrimaryColor7)),
              onPressed: () {
                // context.read<AddToCartCubit>().addToCard(id: product.id!);
              },
              child: const Text(
                'Done ✅',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
          if (state is AddToCartLoading) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          } else {
            return ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kPrimaryColor7)),
              onPressed: () {
                context.read<AddToCartCubit>().addToCard(id: product.id!);
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.black),
              ).tr(),
            );
          }
        },
      ),
    );
  }
}


