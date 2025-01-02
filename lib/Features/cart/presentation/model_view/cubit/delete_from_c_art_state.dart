part of 'delete_from_c_art_cubit.dart';

sealed class DeleteFromCArtState extends Equatable {
  const DeleteFromCArtState();

  @override
  List<Object> get props => [];
}

final class DeleteFromCArtInitial extends DeleteFromCArtState {}



final class DeleteFromCartLoading extends DeleteFromCArtState {
  
}
final class DeleteFromCartError extends DeleteFromCArtState {
  final String message;

  const DeleteFromCartError({required this.message});
}
final class DeleteFromCartSuccess extends DeleteFromCArtState {
  final String message;

  const DeleteFromCartSuccess({required this.message});
}