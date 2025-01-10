// ignore: file_names

// ignore: file_names
class ChangePasswordModel {
  final String message;

  ChangePasswordModel({required this.message});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      message: json['message'],
    );
  }
}
