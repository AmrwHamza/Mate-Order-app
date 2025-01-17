import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/constants.dart';

import 'favorites_view_body.dart';

class FavoritsView extends StatelessWidget {
  const FavoritsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KBackgroundColor,

      appBar: mainAppBar('My Favorite'),
      body: const FavoritesViewBody(),
    );
  }
}
