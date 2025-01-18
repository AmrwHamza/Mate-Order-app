// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/stores/data/repository/show_store_products_service.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/stores_bloc/stores_bloc.dart';

import '../../../data/models/store_products_model/store_products_model.dart';

part 'store_products_event.dart';
part 'store_products_state.dart';

class StoreProductsBloc extends Bloc<StoreProductsEvent, StoreProductsState> {
  int currentPage = 1;
  bool hasMore = false;
  int id = 0;

  StoreProductsBloc() : super(StoreProductsInitial()) {
    on<FetchStoreProducts>(onFetchStoreProducts);
  }

  Future<void> onFetchStoreProducts(
      FetchStoreProducts event, Emitter<StoreProductsState> emit) async {

    if (state is StoreProductslLoading || state is StoreProductsLoadingMore) {
      return;
    }

    try {
      List<Data> currentProducts = [];
      if (state is StoreProductsLoaded || state is StoresLoadingMore) {
        currentProducts = List.from((state as dynamic).allProducts);
      }
      emit(StoreProductsLoadingMore(allProducts: currentProducts));

      final result = await ShowStoreProductsService()
          .getStoreProducts(id: event.id, pageNumber: currentPage);

      result.fold(
        (l) {
          emit(StoreProductsError(message: l.message));
        },
        (r) {
          if (r.pagination?.nextPageUrl != null) {
            hasMore = true;
            currentPage += 1;
          } else {
            hasMore = false;
          }

          final allProducts = [...currentProducts, ...?r.data]; ///////?
          emit(StoreProductsLoaded(
              allProducts: allProducts, hasReachedMax: !hasMore));
        },
      );
    } catch (e) {
      emit(StoreProductsError(message: "Failed to fetch products: $e"));
    }
  }
}
