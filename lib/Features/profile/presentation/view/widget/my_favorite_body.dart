import 'package:flutter/material.dart';
import '../../../../main home/widget/app_bar_style.dart';

class MyFavoriteBody extends StatelessWidget {
  const MyFavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle('My Favorite'),
    );
  }
}
