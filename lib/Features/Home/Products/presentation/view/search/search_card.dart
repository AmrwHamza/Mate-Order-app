import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/search/search_products_view.dart';
import 'package:mate_order_app/constants.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const SearchProductsView(),
            curve: Curves.easeOut, //easeOut
            duration: const Duration(milliseconds: 500),
            transition: Transition.rightToLeft);
      },
      child: Hero(
        tag: 'SearchBarForHomeProducts',
        child: Card(
          elevation: 5,
          color: kPrimaryColor6,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search_outlined),
                ),
                Center(child: const Text('Search for Products').tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
