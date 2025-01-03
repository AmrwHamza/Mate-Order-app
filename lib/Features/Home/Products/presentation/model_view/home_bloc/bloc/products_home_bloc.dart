import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../core/utils/api_services.dart';
import '../../../../data/models/products_with_category_model/products_with_category/products_with_category.dart';
import '../../../../data/repository/get_products_with_category_services/get_products_with_category_repository.dart';

part 'products_home_event.dart';
part 'products_home_state.dart';

class ProductsHomeBloc extends Bloc<ProductHomeEvent, ProductsHomeState> {
  int currentPage = 1;
  bool hasMore = false;
  String category = "";
  ProductsHomeBloc() : super(ProductsHomeInitial()) {
    // category = initialCategory;
    on<FetchProductsHome>(onFetchProducts);
  }

  Future<void> onFetchProducts(
      FetchProductsHome event, Emitter<ProductsHomeState> emit) async {
    if (event.category != category) {
      category = event.category;
      currentPage = 1;
      hasMore = true;
      emit(ProductsHomeInitial());
    }

    if (state is ProductsHomeLoading || state is ProductsHomeLoadingMore) {
      return;
    }
    try {
      List<Data>? currentProducts = [];
      if (state is ProductsHomeLoaded || state is ProductsHomeLoadingMore) {
        currentProducts = List.from((state as dynamic).allProducts);
      }

      emit(ProductsHomeLoadingMore(allProducts: currentProducts));



      final result = await GetProductsWithCategoryRepository(Api())
          .getProuducts(pageNumber: currentPage, category: category);
      result.fold(
        (left) {

          emit(ProductsHomeError(left.message));
        },
        (right) {
          if (right.pagination?.nextPageUrl != null) {
            hasMore = true;
            currentPage += 1;
          } else {
            hasMore = false;
          }

          final allProducts = [...?currentProducts, ...?right.data];

          emit(ProductsHomeLoaded(
              allProducts: allProducts, hasReachedMax: !hasMore));
        },
      );
    } catch (e) {
      
      emit(ProductsHomeError("Failed to fetch products: $e"));
    }
  }
}
