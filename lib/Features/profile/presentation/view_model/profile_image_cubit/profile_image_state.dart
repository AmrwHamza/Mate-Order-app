  part of 'profile_image_cubit.dart';

  sealed class ProfileImageState extends Equatable {
    const ProfileImageState();

    @override
    List<Object> get props => [];
  }

  final class ProfileImageInitial extends ProfileImageState {}

  final class ProfileImageLoading extends ProfileImageState {}

  final class ProfileImageDelFailure extends ProfileImageState {
    final String message;

    const ProfileImageDelFailure(this.message);

    @override
    List<Object> get props => [message];
  }

  final class ProfileImageShowFailure extends ProfileImageState {
    final String message;

    const ProfileImageShowFailure(this.message);

    @override
    List<Object> get props => [message];
  }

  final class ProfileImageUpdateFailure extends ProfileImageState {
    final String message;

    const ProfileImageUpdateFailure(this.message);

    @override
    List<Object> get props => [message];
  }

  final class ProfileImageUpdateSuccess extends ProfileImageState {
    final String message;

    const ProfileImageUpdateSuccess({required this.message});
  }

  final class ProfileImageDelSuccess extends ProfileImageState {
      final String message;

    const ProfileImageDelSuccess({ required this.message});
    @override
    List<Object> get props => [message];
  }

  final class ProfileImageShowSuccess extends ProfileImageState {
    final File imageData;

    const ProfileImageShowSuccess(this.imageData);

    @override
    List<Object> get props => [imageData];
  }
