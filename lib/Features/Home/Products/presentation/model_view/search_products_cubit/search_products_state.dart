part of 'search_products_cubit.dart';

sealed class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final List<Data> products;

  const SearchProductsSuccess({required this.products});
}

final class SearchProductsError extends SearchProductsState {
  final String message;

  const SearchProductsError({required this.message});
}
