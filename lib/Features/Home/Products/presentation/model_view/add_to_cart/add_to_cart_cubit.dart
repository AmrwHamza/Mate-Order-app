import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/map/data/repository/add_address_service.dart';

import '../../../data/repository/add_to_card/add_to_card_service.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  Future<void> addToCard({required int id}) async {
    emit(AddToCartLoading());
    var result = await AddToCardService().addToCard(productID: id);

    result.fold(
      (l) {
        emit(AddToCartError(message: l.message));
      },
      (r) {
        emit(AddToCartSuccess(message: r.message ?? "Added To Cart"));
      },
    );
  }
}
