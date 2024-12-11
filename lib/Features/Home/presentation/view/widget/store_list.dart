import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/card_of_store.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: const CardOfStore(),
            );
          }),
    );
  }
}
