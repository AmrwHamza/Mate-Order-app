import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';
import 'package:mate_order_app/Features/Home/Products/data/repository/search_products_services/search_products_service.dart';
part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit() : super(SearchProductsInitial());

  Future<void> search(String q) async {
    // emit(SearchProductsInitial());
    emit(SearchProductsLoading());
    var result = await SearchProductsService().searchProducts(q);
    result.fold(
      (l) {
        emit(SearchProductsError(message: l.message));
      },
      (r) {
        final List<Data> products = [...?r.data];

        emit(SearchProductsSuccess(products: products));
      },
    );
  }
}
