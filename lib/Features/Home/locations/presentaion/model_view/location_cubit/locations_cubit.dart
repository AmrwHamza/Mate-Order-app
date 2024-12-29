import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/locations/data/models/address_list_model.dart';
import 'package:mate_order_app/Features/Home/locations/data/repository/show_locations_services.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitial());
  late AddressListModel addressListModel;

  LocationsServices locationsServices = LocationsServices();
  void getLocations() async {
    emit(LocationsLoading());
    var result = await locationsServices.showLocations();

    result.fold(
      (left) {
        emit(LocationsError(message: left.message));

        print('Error${left.message}');
      },
      (right) {
        addressListModel = right;
        emit(LocationsSuccess(addressListModel: right));
      },
    );
  }

 }
