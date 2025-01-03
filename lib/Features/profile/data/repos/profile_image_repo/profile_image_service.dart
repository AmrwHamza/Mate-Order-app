import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mate_order_app/Features/profile/data/models/profile_image/profile_image_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class ProfileImageService {
  late Api api;
  ProfileImageService(
    this.api,
  );

  Future<Either<Failure, File>> showImage() async {
    final result = await api.getWithAuth(
        endPoint: 'showImage', responseType: ResponseType.bytes);

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (data) {
        try {
          if (data is Uint8List) {
            if (data.length < 80) {
              return const Left(UnknownFailure('Yor don\'t have profile image'));
            } else {

              final tempDir = Directory.systemTemp;
              final tempFile = File(
                  '${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg');
              tempFile.writeAsBytesSync(data);

              return Right(tempFile);
            }
          } else {
            return const Left(UnknownFailure());
          }
        } catch (e) {
          return const Left(UnknownFailure());
        }
      },
    );
  }

  Future<Either<Failure, dynamic>?> updateImage(File imageFile) async {
    try {
      final mimeType = lookupMimeType(imageFile.path);

      final multipartFile = await dio.MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
        contentType: mimeType != null ? dio.DioMediaType.parse(mimeType) : null,
      );
      final FormData data = FormData.fromMap({
        "image": multipartFile,
      });

      final result = await api.postWithAuth(
        endPoint: 'updateImage',
        data: data,
      );

      if (result.isLeft()) {
        final failure = result.swap().getOrElse(() => const UnknownFailure());
        return Left(failure);
      }

      return result.fold(
        (failure) => Left(failure),
        (data) {
          return Right(ProfileImageModel.fromJson(data));
        },
      );
    } on Exception {
      // print("error to upload image: $e");
      return null;
    }
  }

  Future<Either<Failure, ProfileImageModel>> deleteImage() async {
    final result = await api.deleteWithAuth(endPoint: 'deleteImage', data: {});
    return result.fold((failure) => Left(failure), (data) {
      return Right(ProfileImageModel.fromJson(data));
    });
  }
}
