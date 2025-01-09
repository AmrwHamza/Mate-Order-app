// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/cart/locations/data/repository/show_locations_services.dart';

part 'delete_location_state.dart';

class DeleteLocationCubit extends Cubit<DeleteLocationState> {
  DeleteLocationCubit() : super(DeleteLocationInitial());

  LocationsServices locationsServices = LocationsServices();
  void deleteLocation({required int id}) async {
    emit(DeleteLocationLoading());
    final result = await locationsServices.deleteAddress(id: id);
    result.fold(
      (left) => emit(DeleteLocationError(message: left.message)),
      (right) {
        emit(DeleteLocationSuccess(
            message: right.message ?? 'Address Deleted Sucssfully'));
      },
    );
  }
}
