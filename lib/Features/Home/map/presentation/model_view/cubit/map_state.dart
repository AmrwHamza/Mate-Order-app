part of 'map_cubit.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {}

final class MapLoading extends MapState {}

final class MapSuccess extends MapState {}

final class MapError extends MapState {
  final String message;

  const MapError({required this.message});

}
