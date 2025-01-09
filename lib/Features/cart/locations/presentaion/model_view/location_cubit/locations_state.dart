part of 'locations_cubit.dart';

sealed class LocationsState extends Equatable {
  const LocationsState();

  @override
  List<Object> get props => [];
}

final class LocationsInitial extends LocationsState {}

final class LocationsLoading extends LocationsState {}

final class LocationsSuccess extends LocationsState {
  final AddressListModel addressListModel;

  const LocationsSuccess({required this.addressListModel});
}

final class LocationsError extends LocationsState {
  final String message;

  const LocationsError({required this.message});
}


