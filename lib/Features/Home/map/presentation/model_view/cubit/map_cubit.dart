// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/Home/map/data/models/marker_data.dart';
import 'package:mate_order_app/Features/Home/map/data/repository/add_address_service.dart';

import '../../../../../cart/locations/presentaion/model_view/location_cubit/locations_cubit.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  late MarkerData marker;

  LocationsCubit locationsCubit = LocationsCubit();
  void setCurrentLocation({required MarkerData currentmarker}) {
    marker = currentmarker;
  }

  Future<bool> addAddress() async {
    emit(MapLoading());
    final result = await AddAddressService().addAddress(
        title: marker.title,
        description: marker.description,
        longitude: marker.position.longitude,
        latitude: marker.position.latitude);

    return result.fold((l) {
      emit(MapError(message: l.message));
      print("==================${l.message}================");
      return false;
    }, (r) {
      emit(MapSuccess());
      return true;
    });
  }
}
