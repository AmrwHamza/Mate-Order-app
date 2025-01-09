import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/cart/cart/data/repository/edit_amount_service.dart';

part 'edit_amount_state.dart';

class EditAmountCubit extends Cubit<EditAmountState> {
  // late int newAmount;
  int currentAmount;
  final int max;
  final int productId;
  late int totalPrice;
  final int thePriceForOne;

  EditAmountCubit(
      this.currentAmount, this.max, this.productId, this.thePriceForOne)
      : super(EditAmountInitial()) {
    totalPrice = currentAmount * thePriceForOne;
  }
  void editAmount({required int editnum}) {
    if (currentAmount + editnum < 1 || currentAmount + editnum > max) {
      if (currentAmount + editnum < 1) {
        currentAmount = 1;
        totalPrice = thePriceForOne;
      }
      if (currentAmount + editnum > max) {
        currentAmount = max;
        totalPrice = max * thePriceForOne;
      }
    } else {
      currentAmount += editnum;
      totalPrice = currentAmount * thePriceForOne;
    }

    emit(EditAmountChanged(
        currentAmount: currentAmount, totalPrice: totalPrice));
  }

  Future<void> confirmEditAmount() async {
    if (!isClosed) {
      emit(EditAmountConfirmLoading());
    }
    final result = await EditAmountService()
        .editAmount(productId: productId, newAmount: currentAmount);
    result.fold(
      (left) {
        if (!isClosed) {
          emit(EditAmountConfirmError(mess: left.message  ));
        }
      },
      (right) {
        if (!isClosed) {
          emit(EditAmountConfirmSuccess());
        }
      },
    );
  }
}
