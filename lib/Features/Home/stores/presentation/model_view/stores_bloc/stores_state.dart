part of 'stores_bloc.dart';

sealed class StoresState extends Equatable {
  const StoresState();

  @override
  List<Object> get props => [];
}

final class StoresInitial extends StoresState {}

class StoresLoading extends StoresState {}

class StoresLoadingMore extends StoresState {
  final List<Store>? allStores;

  const StoresLoadingMore({this.allStores});
}

class StoresLoaded extends StoresState {
  final List<Store>? allStores;
    final bool hasReachedMax;

  const StoresLoaded({this.allStores, required this.hasReachedMax});
}

class StoresError extends StoresState  {
  final String message;

  const StoresError(this.message);
}
