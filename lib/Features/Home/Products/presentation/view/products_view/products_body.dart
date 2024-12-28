import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/search/search_products_view.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/search/search_card.dart';
import '../../../../../../constants.dart';
import 'products_list.dart';
import '../search/search_bar_for_home.dart';
import '../see_all_products/see_all_products_view.dart';

class ProductsWidget extends StatelessWidget {
  ProductsWidget({super.key});

  final TextEditingController productsSearchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
        child: Column(
          
          children: [
            // child: SearchBarForHome(SearchController: productsSearchController)),
            SearchCard(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: kCategory.isNotEmpty ? kCategory.length : 0,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            kCategory.isNotEmpty
                                ? kCategory[index]
                                : 'غير متاح',
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Get.to(SeeAllProductsView(
                                    categoryName: kCategory[index]));
                              },
                              child: const Text('See All')),
                        ],
                      ),
                      ProductsList(
                        categoryName: kCategory[index],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
