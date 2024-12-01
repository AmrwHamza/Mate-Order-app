import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/home/Cart/cart_page.dart';
import 'package:mate_order_app/Features/home/Notification/notification_page.dart';
import 'package:mate_order_app/Features/home/home_page/home_page.dart';
import 'package:mate_order_app/Features/home/Profile/profile_page.dart';
import 'package:mate_order_app/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    const HomePage(),
    const NotificationPage(),
    const CartPage(),
    ProfilePage(),
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
