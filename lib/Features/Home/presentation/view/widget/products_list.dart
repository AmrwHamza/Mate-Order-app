import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/card_of_product.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child:  CardOfProduct(),
            );
          }),
    );
  }
}