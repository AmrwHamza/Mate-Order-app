import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuOption(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        trailing: Icon(Icons.chevron_right),
        leading: Icon(icon, color: Colors.black),
        title: Text(text),
      ),
    );
  }
}
