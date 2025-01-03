// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/OTP/data/repository/re_send_code_service.dart';
import 'package:mate_order_app/Features/auth/OTP/data/repository/verify_service.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  bool isLoading = false;

  Future<void> verifyClick({required String? token}) async {
    emit(VerifyLoading());

    final String smscode = c1.text + c2.text + c3.text + c4.text + c5.text + c6.text;

    final VerifyService service = VerifyService(Api());

    final verifyModel = await service.verify(data: {
      'code': smscode,
    }, token: token);

    verifyModel.fold(
      (l) => emit(VerifyFailure(l.message)),
      (r) async {
        await saveuserToken(token!);

        return emit(VerifySuccess());
      },
    );
    isLoading = false;
  }

  Future<void> reSendClick({required String? token}) async {
    emit(VerifyLoading());
    final result = await ReSendCodeService().reSend(token: token);
    result.fold(
      (l) => emit(ReSendFailure(l.message)),
      (r) => emit(ReSendSuccess(r.message!)),
    );
    isLoading = false;
  }

  Future<void> saveuserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
  }
}
