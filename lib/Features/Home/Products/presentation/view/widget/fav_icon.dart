import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../../model_view/fav_cubit/fav_cubit.dart';

class FavIcon extends StatelessWidget {
  final Product product;

  const FavIcon({super.key, required this.product});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavCubit(
          product, product.fav! ? Icons.favorite : Icons.favorite_border),
      child: BlocConsumer<FavCubit, FavState>(
        key: key,
        listener: (BuildContext context, FavState state) {
          if (state is FavError) {
            Get.snackbar('Error', state.error);
          }
        },
        builder: (context, state) {
          final favCubit = context.read<FavCubit>();

          IconData icon;

          if (state is FavInitial) {
            icon = state.isFavorite ? Icons.favorite : Icons.favorite_border;
          } else if (state is UpdateFav) {
            icon = favCubit.iconData;
          } else {
            icon = favCubit.iconData;
          }

          return IconButton(
            onPressed: () {
              favCubit.onPressFavIcon();
            },
            icon: Icon(icon),
            color: Colors.red,
          );
        },
      ),
    );
  }
}
