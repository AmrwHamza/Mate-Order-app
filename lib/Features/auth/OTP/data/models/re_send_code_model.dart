import 'package:equatable/equatable.dart';

class ReSendCodeModel extends Equatable {
  final String? message;

  const ReSendCodeModel({this.message});

  factory ReSendCodeModel.fromJson(Map<String, dynamic> json) =>
      ReSendCodeModel(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
