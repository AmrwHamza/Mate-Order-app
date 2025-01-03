import 'package:flutter/material.dart';

class MyFavoriteButton extends StatelessWidget {
  const MyFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const ListTile(
        trailing: Icon(Icons.chevron_right),
        leading: Icon(Icons.favorite, color: Colors.black),
        title: Text('My Favorite'),
      ),
    );
  }
}
