import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/auth/login/data/models/login_user_model.dart';
import 'package:mate_order_app/Features/auth/login/data/repository/login_service.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isLoading = false;
  String? phone;
  String? password;

  Future<void> onTapLoginButton() async {
    isLoading = true;
    emit(LoginLoading());

    var result =
        await LoginService(Api()).login(phone: phone, password: password);

    result.fold(
      (l) {
        return emit(LoginFailure(error: l.message));
        
      },
      (r) {
        return emit(LoginSuccess(loginUserModel: r));
      },
    );
  }
}
