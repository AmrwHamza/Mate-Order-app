import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/products_list.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/search_bar_for_home.dart';

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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SearchBarForHome(
                SearchController: productsSearchController),
            SizedBox(height: 20),
            Text(
              'Category Name',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15),
            ProductsList(),
            SizedBox(height: 15),
            Text(
              'Category Name',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15),
            ProductsList(),
            SizedBox(height: 15),
            Text(
              'Category Name',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15),
            ProductsList(),
          ],
        ),
      ),
    );
  }
}
