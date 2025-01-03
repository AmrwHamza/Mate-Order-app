// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/auth/login/data/models/login_user_model.dart';
import 'package:mate_order_app/Features/auth/login/data/repository/login_service.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';
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

    final result =
        await LoginService(Api()).login(phone: phone, password: password);

    result.fold(
      (l) {
        return emit(LoginFailure(error: l.message));
      },
      (r) async {
        await saveuserToken(r.accessToken!);

        return emit(LoginSuccess(loginUserModel: r));
      },
    );
  }

  Future<void> saveuserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
  }
}
