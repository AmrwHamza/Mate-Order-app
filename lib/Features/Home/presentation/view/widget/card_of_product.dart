import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/product_details.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/product_option_sheet.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class CardOfProduct extends StatefulWidget {
  CardOfProduct({super.key});

  @override
  State<CardOfProduct> createState() => _CardOfProductState();
}

class _CardOfProductState extends State<CardOfProduct> {
  int numberOfproducts = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(),
            transition: Transition.fade, duration: KTransitionDuration);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        height: 160,
        width: 155,
        child: Padding(
          padding: const EdgeInsets.all(5),
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
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
              AspectRatio(
                aspectRatio: 3.4 / 2,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsData.product),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Product Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r'100 $',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ProductOptionSheet(
                                numberOfproducts: numberOfproducts);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            numberOfproducts = value;
                          });
                        }
                      });
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: kPrimaryColor4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
