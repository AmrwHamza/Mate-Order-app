import 'package:equatable/equatable.dart';

class ProfileInfModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const ProfileInfModel(
      {required this.firstName, required this.lastName, required this.email, required this.phoneNumber});

  factory ProfileInfModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone'] as String,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber];
}
