part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {
  final bool isFavorite;

  const FavInitial({required this.isFavorite});
}

final class FavLoading extends FavState {}

// final class UpdateFav extends FavState {
//   final String message;

//   const UpdateFav({required this.message});
//   List<Object> get props => [message];
// }

final class FavError extends FavState {
  final String error;

  const FavError({required this.error});
}
