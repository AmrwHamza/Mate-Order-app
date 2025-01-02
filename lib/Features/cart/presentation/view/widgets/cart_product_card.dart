import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/product_details/product_details.dart';
import 'package:mate_order_app/Features/Home/oredr/presentation/model_view/bloc/order_bloc.dart';
import 'package:mate_order_app/Features/cart/presentation/model_view/cubit/cart_cubit.dart';
import 'package:mate_order_app/constants.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../../../../Home/Products/presentation/view/fav_icon/fav_icon.dart';
import '../../model_view/cubit/delete_from_c_art_cubit.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,

      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 100,
      // width: 20,
      decoration: BoxDecoration(
          color: kPrimaryColor8, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2.9 / 2,
              child: Hero(
                tag: '${product.id}${product.imagePath}',
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: image(product),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              color: kPrimaryColor10,
              thickness: 5,
              indent: 5,
              endIndent: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product name: ${product.name}' ?? 'No NAMe',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Price: ${product.price} " r'$',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: OrderButton(
                          product: product, buttonColor: Colors.greenAccent),
                    ),
                    DeleteButtonFromCart(
                      id: product.id!,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider image(Product product) {
    if (product.imagePath != null) {
      try {
        return NetworkImage("$baseurlImg"
            "${product.imagePath!}");
      } catch (e) {
        return const AssetImage(AssetsData.product);
      }
    } else {
      return const AssetImage(AssetsData.product);
    }
  }
}

class DeleteButtonFromCart extends StatelessWidget {
  const DeleteButtonFromCart({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteFromCArtCubit(),
      child: BlocConsumer<DeleteFromCArtCubit, DeleteFromCArtState>(
        listener: (context, state) {
          if (state is DeleteFromCartError) {
            Get.snackbar('Error', state.message);
          }
          if (state is DeleteFromCartSuccess) {
            context.read<CartCubit>().getCartProducts();
          }
        },
        buildWhen: (previous, current) =>
            current is DeleteFromCartLoading ||
            current is CartInitial ||
            current is DeleteFromCartError,
        builder: (context, state) {
          if (state is DeleteFromCartLoading) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          }
          return ElevatedButton(
              onPressed: () {
                context.read<DeleteFromCArtCubit>().deleteFromCart(id: id);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.black),
              ));
        },
      ),
    );
  }
}
