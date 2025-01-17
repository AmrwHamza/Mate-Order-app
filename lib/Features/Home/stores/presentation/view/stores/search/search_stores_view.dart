import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/view/stores/search/search_stores_body.dart';

import '../../../../../../../constants.dart';
import '../../../../../../main home/widget/app_bar_style.dart';

class SearchStoresView extends StatelessWidget {
  const SearchStoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Search for stores'),
      body: SearchStoresBody(),
      // backgroundColor: KBackgroundColor,
    );
  }
}
