class LogoutModel {
  final String message;

  LogoutModel({required this.message});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      message: json['message'] ?? 'Logged out successfuly ',
    );
  }
}
