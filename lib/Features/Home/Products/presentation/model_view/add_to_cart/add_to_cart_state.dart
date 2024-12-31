part of 'add_to_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartError extends AddToCartState {
  final String message;

  const AddToCartError({required this.message});
}

final class AddToCartSuccess extends AddToCartState {
  final String message;

  const AddToCartSuccess({required this.message});
}
