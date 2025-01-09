part of 'add_order_cubit.dart';

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderError extends AddOrderState {
  final String message;

  const AddOrderError({required this.message});
}

final class AddOrderSuccess extends AddOrderState {
    final String message;

  const AddOrderSuccess({required this.message});

}
