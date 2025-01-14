import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/search/search_card.dart';
import '../../../../../../constants.dart';
import 'products_list.dart';
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
        padding: const EdgeInsets.only(bottom: 5, left: 0, right: 0),
        child: Column(
          children: [
            const SearchCard(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: kCategory.isNotEmpty ? kCategory.length : 0,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      // offset: Offset(3, 2),
                                      color: kPrimaryColor7)
                                ],
                                color: kPrimaryColor8,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(7),
                              child: Text(
                                kCategory.isNotEmpty
                                    ? kCategory[index]
                                    : 'غير متاح',
                                style: const TextStyle(
                                  color: kPrimaryColor1,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ).tr(),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Get.to(SeeAllProductsView(
                                    categoryName: kCategory[index]));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Text('See All').tr(),
                              )),
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
