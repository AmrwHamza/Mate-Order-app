part of 'store_products_bloc.dart';

abstract class StoreProductsEvent {}

class FetchStoreProducts extends StoreProductsEvent {
  int id;

  FetchStoreProducts({required this.id});
}


