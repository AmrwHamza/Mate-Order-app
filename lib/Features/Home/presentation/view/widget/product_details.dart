import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int numberOfproducts = 1;
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
                AspectRatio(
                  aspectRatio: 1.3,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsData.product),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Name of product',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  r'The Price : 100$',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text('Description : '),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (numberOfproducts > 1) {
                            numberOfproducts--;
                          }
                        });
                      },
                      icon: Icon(
                        size: 30,
                        Icons.remove_circle,
                        color: kPrimaryColor3,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$numberOfproducts',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        size: 30,
                        color: kPrimaryColor3,
                        fill: 0.5,
                        applyTextScaling: true,
                      ),
                      onPressed: () {
                        setState(() {
                          numberOfproducts++;
                        });
                      },
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
}
