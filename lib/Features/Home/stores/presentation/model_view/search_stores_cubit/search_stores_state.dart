part of 'search_stores_cubit.dart';

sealed class SearchStoresState extends Equatable {
  const SearchStoresState();

  @override
  List<Object> get props => [];
}

final class SearchStoresInitial extends SearchStoresState {}

final class SearchStoresLoading extends SearchStoresState {}

final class SearchStoresSuccess extends SearchStoresState {
  final List<Store> stores;

  const SearchStoresSuccess({required this.stores});
}

final class SearchStoresError extends SearchStoresState {
  final String message;

  const SearchStoresError({required this.message});
}
