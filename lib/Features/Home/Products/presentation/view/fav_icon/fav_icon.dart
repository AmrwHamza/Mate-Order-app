import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../../model_view/fav_cubit/fav_cubit.dart';

class FavIcon extends StatelessWidget {
  final Product product;

  const FavIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavCubit(
          product, product.fav! ? Icons.favorite : Icons.favorite_border),
      child: BlocConsumer<FavCubit, FavState>(
        key: key,
        listener: (BuildContext context, FavState state) {
        
        },
        builder: (context, state) {
          final favCubit = context.watch<FavCubit>();

        

          return IconButton(
            onPressed: () {
              favCubit.onPressFavIcon();
            },
            icon: Icon(state is FavLoading
                ? Icons.hourglass_empty
                : favCubit.iconData),
            color: Colors.red,
          );
        },
      ),
    );
  }
}
