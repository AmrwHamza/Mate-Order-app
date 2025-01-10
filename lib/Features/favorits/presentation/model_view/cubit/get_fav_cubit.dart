import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/favorits/data/repository/get_favorites_service.dart';

import '../../../data/models/favorites_modul.dart';

part 'get_fav_state.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit() : super(GetFavInitial());

  Future<void> getFav() async {
    emit(GetFavLoading());

    final result = await GetFavoritesService().getFavorits();

    result.fold(
      (l) => emit(GetFavError(error: l.message)),
      (r) => emit(GetFavSuccess(favoritsModul: r)),
    );
  }
}
