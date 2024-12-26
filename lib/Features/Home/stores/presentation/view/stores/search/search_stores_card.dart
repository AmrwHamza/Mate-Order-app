import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../constants.dart';
import 'search_stores_view.dart';

class SearchStoresCard extends StatelessWidget {
  const SearchStoresCard({super.key});

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        Get.to(SearchStoresView(),
            curve: Curves.easeOut, //easeOut
            duration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft);
      },
      child: Hero(
        tag: 'SearchBarForHome',
        child: Card(
          elevation: 5,
          color: kPrimaryColor8,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search_outlined),
                ),
                Text('Search for Stores'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}