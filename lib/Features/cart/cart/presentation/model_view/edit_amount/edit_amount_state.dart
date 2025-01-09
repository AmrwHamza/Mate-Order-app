part of 'edit_amount_cubit.dart';

sealed class EditAmountState extends Equatable {
  const EditAmountState();

  @override
  List<Object> get props => [];
}

final class EditAmountInitial extends EditAmountState {}

final class EditAmountChanged extends EditAmountState {
  final int currentAmount;
  final int totalPrice;

  const EditAmountChanged(
      {required this.currentAmount, required this.totalPrice});
  @override
  List<Object> get props => [currentAmount, totalPrice];
}

final class EditAmountConfirmLoading extends EditAmountState {}

final class EditAmountConfirmSuccess extends EditAmountState {}

final class EditAmountConfirmError extends EditAmountState {
  final String mess;

  const EditAmountConfirmError({required this.mess});

}
