// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/cart/locations/data/models/address_list_model.dart';
import 'package:mate_order_app/Features/cart/locations/data/repository/show_locations_services.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitial());
  late AddressListModel addressListModel;
  LocationsServices locationsServices = LocationsServices();
  Future<void> getLocations() async {
    emit(LocationsLoading());
    final result = await locationsServices.showLocations();

    result.fold(
      (left) {
        emit(LocationsError(message: left.message));
      },
      (right) {
        addressListModel = right;
        emit(LocationsSuccess(addressListModel: right));
      },
    );
  }
}
