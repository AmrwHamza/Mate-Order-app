part of 'products_home_bloc.dart';

sealed class ProductsHomeEvent extends Equatable {
  const ProductsHomeEvent();

  @override
  List<Object> get props => [];
}

abstract class ProductHomeEvent {}

class FetchProductsHome extends ProductHomeEvent {
  String category;
  FetchProductsHome({required this.category});
}

class RefreshProductsHome extends ProductHomeEvent {}
