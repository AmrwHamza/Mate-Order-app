import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/register/data/models/register_user_model.dart';
import 'package:mate_order_app/Features/auth/register/data/repository/register_repository.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;
  RegisterUserModel? user;
  bool isLoading = false;
  bool isObsecure = true;
  IconData eyeIcon = Icons.visibility_off_outlined;

  Future<void> onTapRegisterButton() async {
    if (password != confirmPassword) {
      emit(const RegisterFailure("Passwoerds don't match"));
    }

    isLoading = true;

    emit(RegisterLoading());
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    final Map<String, dynamic> data = {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phoneNumber,
      'password': password,
      'password_confirmation': confirmPassword,
      'email': email,
      'fcm_token': fcmToken
    };

    final RegisterRepository service = RegisterRepository(Api());
    final result = await service.register(data);

    result.fold(
      (l) {
        print('==================================================${l.message}');
        emit(RegisterFailure(l.message));
      },
      (r) {
        user = r;
        emit(RegisterSuccess(user!));
      },
    );
  }

  void isobsecure() {
    isObsecure = !isObsecure;
    if (eyeIcon == Icons.visibility_off_outlined) {
      eyeIcon = Icons.visibility_outlined;
    } else if (eyeIcon == Icons.visibility_outlined) {
      eyeIcon = Icons.visibility_off_outlined;
    }
    emit(RegisterObsecure(eyeIcon: eyeIcon, isObsecure: isObsecure));
  }
}
