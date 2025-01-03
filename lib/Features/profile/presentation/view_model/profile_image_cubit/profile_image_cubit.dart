import 'dart:io';
import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/profile/data/models/profile_image/profile_image_model.dart';
import 'package:mate_order_app/Features/profile/data/repos/profile_image_repo/profile_image_service.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());
  String? photoPath;
  Uint8List? storeImage;
  bool isLoading = false;

  Future<void> showImage() async {
    try {
      isLoading = true;
      emit(ProfileImageLoading());
      final result = await ProfileImageService(Api()).showImage();
      result.fold((failure) {

        isLoading = false;
        emit(ProfileImageShowFailure(failure.message));
      }, (data) {
        isLoading = false;
        emit(ProfileImageShowSuccess(data));
      });
    } catch (e) {
      emit(ProfileImageShowFailure("$e"));
    }
  }

  Future<void> updateImage(File imageFile) async {
    try {
      isLoading = true;
      emit(ProfileImageLoading());
      final result = await ProfileImageService(Api()).updateImage(imageFile);
      result?.fold((failure) {
        isLoading = false;

        emit(ProfileImageUpdateFailure(failure.message));
      }, (data) {
        isLoading = false;

        emit(ProfileImageUpdateSuccess(message: data.message!));
      });
    } on Exception catch (e) {
      emit(ProfileImageShowFailure('$e'));
    }
  }

  Future<void> deleteImage() async {
    try {
      isLoading = true;
      emit(ProfileImageLoading());
      final result = await ProfileImageService(Api()).deleteImage();
      result.fold((failure) {
        emit(ProfileImageDelFailure(failure.message));
        isLoading = false;
      }, (data) {

        emit(ProfileImageDelSuccess(message: data.message!));
        isLoading = false;
      });
    } on Exception catch (e) {
      emit(ProfileImageDelFailure('$e'));
    }
  }
}
