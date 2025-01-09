// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/delete_product_of_cart_service.dart';

part 'delete_from_c_art_state.dart';

class DeleteFromCArtCubit extends Cubit<DeleteFromCArtState> {
  DeleteFromCArtCubit() : super(DeleteFromCArtInitial());




  Future<void> deleteFromCart({required int id}) async {
    if (isClosed) {
      return;
    }
    emit(DeleteFromCartLoading());

    final result = await Deleteproductofcartservice().deleteFromCart(id: id);
 if (isClosed) {
      return;
    }
    result.fold(
      (left) {
        emit(DeleteFromCartError(message: left.message));
      },
      (right) {


        emit(DeleteFromCartSuccess(message: right.message??'done'));

        
        // emit(CartInitial());
      },
    );
  }
}
