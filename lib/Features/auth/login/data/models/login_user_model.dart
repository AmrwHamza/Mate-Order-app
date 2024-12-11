import 'package:equatable/equatable.dart';

class LoginUserModel extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  const LoginUserModel({this.accessToken, this.tokenType, this.expiresIn});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
      };

  @override
  List<Object?> get props => [accessToken, tokenType, expiresIn];
}
