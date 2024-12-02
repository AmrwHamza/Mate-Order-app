import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/OTP/data/models/verify_model.dart';
import 'package:mate_order_app/Features/auth/OTP/data/repository/verify_service.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  bool isLoading = false;

  Future<void> verifyClick({required String token}) async {
    emit(VerifyLoading());

    print(c1.text);
    String smscode = c1.text + c2.text + c3.text + c4.text + c5.text + c6.text;
    VerifyService service = VerifyService(Api());
    VerifyModel verifyModel = await service.verify(data: {
      'code': smscode,
    }, token: token);

    print('================================');
    print(smscode);
    print('================================');
  }
}
