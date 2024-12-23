import 'package:flutter/material.dart';


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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        size: 30,
                        Icons.remove_circle,
                        color: kPrimaryColor3,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$numberOfproducts',
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                        color: kPrimaryColor3,
                        fill: 0.5,
                        applyTextScaling: true,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsData.product),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
