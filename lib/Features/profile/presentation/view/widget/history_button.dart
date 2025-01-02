import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        trailing: const Icon(Icons.chevron_right),
        leading: Icon(Icons.calendar_month, color: Colors.black),
        title: Text('History'),
      ),
    );
  }
}
