import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../fav_icon/fav_icon.dart';
import '../product_details/product_details.dart';

// ignore: must_be_immutable
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
            // color: Colors.white,
            color: kPrimaryColor5,
            boxShadow: const [BoxShadow(blurRadius: 3, color: kPrimaryColor4)]),
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
                  FavIcon(
                    product: product,
                  ),
                ],
              ),
              AspectRatio(
                aspectRatio: 3.4 / 2,
                child: Hero(
                  tag: '${product.id}${product.imagePath}${product.createdAt}',

                  child: CachedNetworkImage(
                    imageUrl: "$baseurlImg"
                        "${product.imagePath!}",
                    placeholder: (context, url) => const Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),

                  //     /// image: DecorationImage(
                  //     //   // image:AssetImage() ,
                  //     //   // image: AssetImage(AssetsData.product),
                  //     //   // image: NetworkImage(
                  //     //   //     "https://c862-130-180-148-76.ngrok-free.app/storage/project/products/11/Screenshot (7).png"
                  //     //   //     "https://a8bc-146-70-202-35.ngrok-free.app/storage/project/products/4/Tile_Border_Travertine.bmp"), //products/5/PSX_20200918_165328.jpg
                  //     //   image: image(product),
                  //     //   fit: BoxFit.fill,
                  //     // ),
                  //   ),
                  // ),
                ),
              ),
              Text(
                product.name ?? 'No Name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price} ",
                  ),
                  const Text('SYP').tr()
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
        return CachedNetworkImageProvider(
          "$baseurlImg"
          "${product.imagePath!}",
        );
        // return NetworkImage("$baseurlImg"
        //     "${product.imagePath!}");
      } catch (e) {
        return const AssetImage(AssetsData.product);
      }
    } else {
      return const AssetImage(AssetsData.product);
    }
  }
}
//https://c862-130-180-148-76.ngrok-free.app/storage/products/5/PSX_20200918_165328.jpg