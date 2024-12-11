import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/cart/presentation/view/cart_page.dart';
import 'package:mate_order_app/Features/Nonification/presentation/view/notification_page.dart';
import 'package:mate_order_app/Features/Home/presentation/view/home_page.dart';
import 'package:mate_order_app/Features/profile/presentation/view/profile_page.dart';
import 'package:mate_order_app/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  static List<Widget> pages = <Widget>[
     HomePage(),
    const NotificationPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor10,
        backgroundColor: kPrimaryColor4,
        unselectedItemColor: kPrimaryColor1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
