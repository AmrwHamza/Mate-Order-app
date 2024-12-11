
import 'package:flutter/material.dart';

class SearchBarForHome extends StatelessWidget {
  const SearchBarForHome({
    super.key,
    required this.SearchController,
  });

  final TextEditingController SearchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      controller: SearchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        hintText: 'Search...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
