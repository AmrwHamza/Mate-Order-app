part of 'store_products_bloc.dart';

sealed class StoreProductsState extends Equatable {
  const StoreProductsState();

  @override
  List<Object> get props => [];
}

final class StoreProductsInitial extends StoreProductsState {}

final class StoreProductslLoading extends StoreProductsState {}

final class StoreProductsLoadingMore extends StoreProductsState {
  final List<Data>? allProducts;

  const StoreProductsLoadingMore({required this.allProducts});
}

final class StoreProductsLoaded extends StoreProductsState {
  final List<Data>? allProducts;

  final bool hasReachedMax;

  const StoreProductsLoaded(
      {required this.allProducts, required this.hasReachedMax});
}

final class StoreProductsError extends StoreProductsState {
  final String message;

  const StoreProductsError({required this.message});
}
