import 'package:equatable/equatable.dart';

class ProfileImageModel extends Equatable {
  final dynamic image;
  final String? message;

  const ProfileImageModel({this.image, this.message});

  factory ProfileImageModel.fromJson(dynamic data) {
   if(data is Map<String,dynamic>) {
      return ProfileImageModel(
        message: data['message'] as String?,
      );
    } else  {
      return ProfileImageModel(
        image: data ,
      );
    } 
  }

  @override
  List<Object?> get props => [image, message];
}
