// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';
import 'package:mate_order_app/Features/Home/stores/data/repository/search_stores_service.dart';

part 'search_stores_state.dart';

class SearchStoresCubit extends Cubit<SearchStoresState> {
  SearchStoresCubit() : super(SearchStoresInitial());

  Future<void> search(String q) async {
    emit(SearchStoresLoading());

    final result = await SearchStoresService().searchStores(q: q);

    result.fold(
      (left) {
        emit(SearchStoresError(message: left.message));
      },
      (r) {
        final List<Store> stores = r.stores!;
        emit(SearchStoresSuccess(stores: stores));
      },
    );
  }
}
