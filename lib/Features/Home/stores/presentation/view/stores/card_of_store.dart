import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/view/store_products/store_products_view.dart';
import 'package:mate_order_app/constants.dart';

class CardOfStore extends StatelessWidget {
  const CardOfStore({super.key, required this.store});
  final Store store;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () {
          Get.to(StoreProductsView(id: store.id!));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kPrimaryColor5,
          ),
          width: double.infinity,
          height: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ClipOval(
              //     child: Image.asset(
              //       AssetsData.store,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 10),
              Text(
                store.storeName ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
