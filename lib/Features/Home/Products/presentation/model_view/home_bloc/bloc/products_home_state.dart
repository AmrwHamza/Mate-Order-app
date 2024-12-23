part of 'products_home_bloc.dart';

sealed class ProductsHomeState extends Equatable {
  const ProductsHomeState();

  @override
  List<Object> get props => [];
}

final class ProductsHomeInitial extends ProductsHomeState {}

class ProductsHomeLoading extends ProductsHomeState {}

class ProductsHomeLoadingMore extends ProductsHomeState {
  final List<Data>? allProducts;

  const ProductsHomeLoadingMore({this.allProducts});
}

class ProductsHomeLoaded extends ProductsHomeState {
  final List<Data>? allProducts;
  final bool hasReachedMax;

  const ProductsHomeLoaded({this.allProducts, required this.hasReachedMax});
}

class ProductsHomeError extends ProductsHomeState {
  final String message;

  const ProductsHomeError(this.message);
}
