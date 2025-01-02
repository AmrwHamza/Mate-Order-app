import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:mate_order_app/Features/auth/logout/data/repo/logout_service.dart';

import 'package:mate_order_app/core/utils/api_services.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  bool isLoading = false;

  Future<void> logout(String endPoint) async {
    emit(LogoutLoading());
    isLoading = true;
    try {
      final result = await LogoutService(Api()).logout(endPoint: endPoint);
      result.fold(
        (failure) => emit(LogoutFailure(error: failure.message)),
        (response) => emit(LogoutSuccess(message: response.message)),
      );
    } on Exception catch (error) {
      emit(LogoutFailure(error: error.toString()));
    }
  }
}
