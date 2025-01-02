import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/model_view/add_to_cart/add_to_cart_cubit.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/widget/product_option_sheet.dart';
import 'package:mate_order_app/Features/Home/oredr/presentation/view/order_sheet_view.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets.dart';
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
      appBar: AppBarStyle('Product Details'),
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
                thePrice(),
                const SizedBox(height: 10),
                theOwner(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OrderButton(
                      product: product,
                      buttonColor: kPrimaryColor8,
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

  Text theOwner() => Text('Owner :${product.owner} ');

  Text thePrice() {
    return Text(
      'The Price : ${product.price}\$',
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
        tag: '${product.id}${product.imagePath}',
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("$baseurlImg"
                  "${product.imagePath!}"),
              // image: AssetImage(AssetsData.product),
              fit: BoxFit.fill,
            ),
          ),
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
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartError) {
          Get.snackbar('Error', state.message);
        }
    
        if (state is AddToCartSuccess) {
          Get.snackbar('Success', state.message);
        }
      },
      builder: (context, state) {
        if (state is AddToCartLoading) {
          return const CircularProgressIndicator(
            color: Colors.black,
          );
        } else {
          return ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kPrimaryColor10)),
              onPressed: () {
                context.read<AddToCartCubit>().addToCard(id: product.id!);
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.black),
              ));
        }
      },
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.product,
    required this.buttonColor,
  });

  final Product product;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(buttonColor)),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withOpacity(0.5),
          builder: (context) {
            return OrderSheet(
              product: product,
            );
          },
        );
      },
      child: const Text('Order Now', style: TextStyle(color: Colors.black)),
    );
  }
}
