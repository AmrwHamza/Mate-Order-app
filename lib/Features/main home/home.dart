import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Nonification/presentation/view/notification_page.dart';
import 'package:mate_order_app/Features/Home/presentation/view/home_page.dart';
import 'package:mate_order_app/Features/profile/presentation/view/profile_page.dart';
import 'package:mate_order_app/constants.dart';

import '../Home/Products/presentation/view/home_page.dart';
import '../cart/presentation/view/cart_view.dart';
import '../orders/orders_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final List<Widget> pages = <Widget>[
    const HomePage(),
    const CartView(),
    const OrdersView(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: kPrimaryColor4,
        activeColor: kPrimaryColor10,
        color: kPrimaryColor1,
        style: TabStyle.react,
        initialActiveIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.checklist_rtl, title: 'Orders'),
          TabItem(icon: Icons.notifications, title: 'Notification'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}
