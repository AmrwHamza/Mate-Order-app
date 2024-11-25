import 'package:flutter/material.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.logo,
        width: 150,
        height: 150,
      ),
    );
  }
}
