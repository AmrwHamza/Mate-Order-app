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
    final theme = Theme.of(context);

    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor ?? theme.cardColor,

        // fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search...'.tr(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
