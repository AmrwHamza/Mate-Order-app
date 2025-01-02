import 'package:flutter/material.dart';
import '../../../../main home/widget/app_bar_style.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle('History'),
    );
  }
}
