import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/model_view/search_products_cubit/search_products_cubit.dart';

class SearchBarForHome extends StatelessWidget {
  const SearchBarForHome({
    super.key,
    required this.searchController,
    required this.onFieldSubmitted,
  });
  final TextEditingController searchController;
  final void Function(String) onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        controller: searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
