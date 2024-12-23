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
    if (product.fav!) {
      iconData = Icons.favorite_border;
      emit(const FavInitial(isFavorite: false)); 
      var result =
          FavoriteService(api: Api()).disFav(id: product.id.toString());
      result.fold(
        (left) {
          iconData = Icons.favorite;
          print('faild dis ${left.message}');
          emit(FavError(error: left.message));
        },
        (right) {
          product.fav = false;
          print('done dis ${right.message}');
          emit(UpdateFav());
        },
      );
    } else {
      iconData = Icons.favorite;
      emit(const FavInitial(isFavorite: true)); 
      var result =
          FavoriteService(api: Api()).addToFav(id: product.id.toString());
      result.fold(
        (left) {
          print('faild add ${left.message}');

          iconData = Icons.favorite_border;
          emit(FavError(error: left.message));
        },
        (right) {
          product.fav = true;
          print('done add ${right.message} ');

          emit(UpdateFav());
        },
      );
    }
  }
}
