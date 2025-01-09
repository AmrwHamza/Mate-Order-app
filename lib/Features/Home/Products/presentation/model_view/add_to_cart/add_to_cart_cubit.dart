// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/add_to_card/add_to_card_service.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  Future<void> addToCard({required int id}) async {
    emit(AddToCartLoading());
    final result = await AddToCardService().addToCard(productID: id);

    result.fold(
      (l) {
          if (!isClosed) {
          emit(AddToCartError(message: l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(AddToCartSuccess(message: r.message ?? "Added To Cart"));
        }
      },
    );
  }
}
