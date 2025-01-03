// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/api_services.dart';
import '../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../../../data/repository/fav/favorite_services.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.product, this.iconData)
      : super(FavInitial(isFavorite: product.fav ?? false)) {
    iconData = product.fav == true ? Icons.favorite : Icons.favorite_border;
  }
  Product product;
  late IconData iconData;

  

Future<void> onPressFavIcon() async {
  try {
    emit(FavLoading());
    if (product.fav!) {
      await FavoriteService(api: Api()).disFav(id: product.id.toString());
      product.fav = false;
      iconData = Icons.favorite_border;
    } else {
      await FavoriteService(api: Api()).addToFav(id: product.id.toString());
      product.fav = true;
      iconData = Icons.favorite;
    }
    
    emit(FavInitial(isFavorite: product.fav!));
  } catch (e) {
     if (isClosed) {
      return;
    }
    emit(FavError(error: e.toString()));
  }
}


}
