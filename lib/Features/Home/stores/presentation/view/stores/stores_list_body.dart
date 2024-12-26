import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/view/stores/search/search_stores_card.dart';

import '../../../../Products/presentation/view/search/search_bar_for_home.dart';
import 'stores_list.dart';

class StoresListBody extends StatelessWidget {
  StoresListBody({super.key});

  final TextEditingController storesSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // SearchBarForHome(SearchController: storesSearchController, searchProductsCubit: null,),
            // SizedBox(height: 20),
            SearchStoresCard(),

            Expanded(child: StoreList())
          ],
        ),
      ),
    );
  }
}
