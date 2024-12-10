import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as tansition;

import 'package:mate_order_app/Features/auth/OTP/presentation/view-models/cubit/verify_cubit.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/count_down_timer_o_t_p.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/custom_text_field_o_t_p.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/o_t_p_row_fields.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/register_view.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/register_text.dart';
import 'package:mate_order_app/Features/home/home_page/home_page.dart';
import 'package:mate_order_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class OTPViewBody extends StatelessWidget {
  const OTPViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(
          create: (context) => VerifyCubit(),
        )
      ],
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          if (state is VerifyLoading) {
            BlocProvider.of<VerifyCubit>(context).isLoading = true;
          } else if (state is VerifyFailure) {
            Get.snackbar('', state.error,
                snackPosition: SnackPosition.BOTTOM);
          } else if (state is VerifySuccess) {
            Get.to(HomePage());
          } else if (state is ReSendSuccess) {
            Get.snackbar('', state.message,
                snackPosition: SnackPosition.BOTTOM);
          } else if (state is ReSendSuccess) {
            Get.snackbar('', state.message,
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: context.watch<VerifyCubit>().isLoading,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Logo(),
                    RegisterOrLogInText(
                      data: 'Verification code',
                    ),
                    Divider(
                      color: kPrimaryColor1,
                      indent: 27,
                      endIndent: 27,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    OTPRowFields(),
                    SizedBox(
                      height: 70,
                    ),
                    CountDownTimerOTP(),
                    SizedBox(
                      height: 70,
                    ),
                    CustomRegisterButton(
                      data: 'Confirm',
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        BlocProvider.of<VerifyCubit>(context, listen: false)
                            .verifyClick(token: registerCubit.user?.token);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomRegisterButton(
                      data: 'Resend the Code',
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        BlocProvider.of<VerifyCubit>(context, listen: false)
                            .reSendClick(token: registerCubit.user?.token);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
  }
}
