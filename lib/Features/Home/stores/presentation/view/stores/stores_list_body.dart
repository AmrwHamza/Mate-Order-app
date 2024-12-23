import 'package:flutter/material.dart';

import '../../../../Products/presentation/view/widget/search_bar_for_home.dart';
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
            SearchBarForHome(SearchController: storesSearchController),
            SizedBox(height: 20),
            Expanded(child: StoreList())
          ],
        ),
      ),
    );
  }
}
