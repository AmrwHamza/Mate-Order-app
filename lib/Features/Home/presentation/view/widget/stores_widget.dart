import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/search_bar_for_home.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/store_list.dart';

class StoresWidget extends StatelessWidget {
  StoresWidget({super.key});

  final TextEditingController storesSearchController = TextEditingController();

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
            SearchBarForHome(SearchController: storesSearchController),
            SizedBox(height: 20),
            StoreList()
          ],
        ),
      ),
    );
  }
}
