import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../fav_icon/fav_icon.dart';
import '../widget/product_details.dart';
import '../widget/product_option_sheet.dart';

class CardOfProduct extends StatelessWidget {
  int numberOfproducts = 1;
  final Product product;
  final bool isFavorite = false;

  CardOfProduct({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => ProductDetails(
                  product: product,
                ),
            duration: const Duration(milliseconds: 500));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        height: 160,
        width: 155,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsData.logoWithoutTitle,
                    height: 35,
                    width: 35,
                  ),

                  //هون كان زر المفضلة

                  FavIcon(
                    product: product,
                  ),
                ],
              ),
              AspectRatio(
                aspectRatio: 3.4 / 2,
                child: Hero(
                  tag: '${product.id}${product.imagePath}',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // image:AssetImage() ,
                        // image: AssetImage(AssetsData.product),
                        // image: NetworkImage(
                        //     "https://c862-130-180-148-76.ngrok-free.app/storage/project/products/11/Screenshot (7).png"
                        //     "https://a8bc-146-70-202-35.ngrok-free.app/storage/project/products/4/Tile_Border_Travertine.bmp"), //products/5/PSX_20200918_165328.jpg
                        image: image(product),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                product.name ?? 'No NAMe',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price} " r'$',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return ProductOptionSheet(
                  //               numberOfproducts: numberOfproducts);
                  //         }).then((value) {
                  //       if (value != null) {
                  //         setState(() {
                  //           numberOfproducts = value;
                  //         });
                  //       }
                  //     });
                  //   },
                  //   icon: const Icon(
                  //     Icons.shopping_bag_outlined,
                  //     color: kPrimaryColor4,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
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
//https://c862-130-180-148-76.ngrok-free.app/storage/products/5/PSX_20200918_165328.jpg