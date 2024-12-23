import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';

import '../../../../../../core/utils/assets.dart';

class CardOfStore extends StatelessWidget {
  const CardOfStore({super.key, required this.store});
  final Store store;
  @override
  Widget build(BuildContext context) {
        print("Displaying store: ${store.storeName}");  // طباعة اسم المتجر عند عرضه

    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  AssetsData.store,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              store.storeName?? '',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
