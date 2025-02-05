import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFrame extends StatelessWidget {
  TextFrame(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  String title;
  IconData icon;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFD9D0E3), width: 1),
            color: theme.cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ]),
        width: 400,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
