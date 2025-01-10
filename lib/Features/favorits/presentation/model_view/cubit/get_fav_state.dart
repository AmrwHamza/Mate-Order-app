part of 'get_fav_cubit.dart';

sealed class GetFavState extends Equatable {
  const GetFavState();

  @override
  List<Object> get props => [];
}

final class GetFavInitial extends GetFavState {}

final class GetFavLoading extends GetFavState {}

final class GetFavError extends GetFavState {
  final String error;

  const GetFavError({required this.error});
}

final class GetFavSuccess extends GetFavState {
  final FavoritsModul favoritsModul;

  const GetFavSuccess({required this.favoritsModul});
}
