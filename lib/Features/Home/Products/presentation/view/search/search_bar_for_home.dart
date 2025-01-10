import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search...'.tr(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
