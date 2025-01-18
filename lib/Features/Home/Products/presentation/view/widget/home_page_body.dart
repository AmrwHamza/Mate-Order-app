import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../products_view/products_body.dart';
import '../../../../stores/presentation/view/stores/stores_list_body.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  static List<Widget> pages = <Widget>[
    ProductsWidget(),
    StoresListBody(),
  ];
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        BottomNavigationBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          selectedItemColor: theme.iconTheme.color
              ?.withOpacity(0.8), 
          unselectedItemColor: theme.iconTheme.color
              ?.withOpacity(0.5), 
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: ''),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
        Expanded(
          child: pages[selectedIndex],
        )
      ],
    );
  }
}
