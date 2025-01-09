import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/Nonification/presentation/view/notification_page.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view/profile_page.dart';
import 'package:mate_order_app/constants.dart';
import '../Home/Products/presentation/view/home_page.dart';

// import '../cart/presentation/view/cart_view.dart';
import '../cart/cart/presentation/view/cart_view.dart';
import '../orders/presentation/model_view/get_orders/get_orders_cubit.dart';
import '../orders/presentation/view/orders_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
            if (index == 1) {
              context.read<CartCubit>().getCartProducts();
            }
            if (index == 2) {
              context.read<GetOrdersCubit>().getOrders();
            }
          });
        },
        items: const [
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
