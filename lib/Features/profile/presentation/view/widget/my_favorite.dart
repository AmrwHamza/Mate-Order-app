 

import 'package:flutter/material.dart';
import '../../../../main home/widget/app_bar_style.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle('My Favorite'),
    );
  }
}
