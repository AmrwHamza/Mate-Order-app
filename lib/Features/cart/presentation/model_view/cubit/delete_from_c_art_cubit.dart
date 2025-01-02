import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/DeleteProductOfCArtService.dart';

part 'delete_from_c_art_state.dart';

class DeleteFromCArtCubit extends Cubit<DeleteFromCArtState> {
  DeleteFromCArtCubit() : super(DeleteFromCArtInitial());




  Future<void> deleteFromCart({required int id}) async {
    if (isClosed) {
      return;
    }
    emit(DeleteFromCartLoading());

    var result = await Deleteproductofcartservice().deleteFromCart(id: id);
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
