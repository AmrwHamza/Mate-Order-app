import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/view-models/cubit/verify_cubit.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/count_down_timer_o_t_p.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/o_t_p_row_fields.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/register_text.dart';
import 'package:mate_order_app/Features/main%20home/home.dart';
import 'package:mate_order_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
            Get.snackbar('', state.error, snackPosition: SnackPosition.BOTTOM);
          } else if (state is VerifySuccess) {
            Get.to(Home());
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    const Logo(),
                    const RegisterOrLogInText(
                      data: 'Verification code',
                    ),
                    const Divider(
                      color: kPrimaryColor1,
                      indent: 27,
                      endIndent: 27,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const OTPRowFields(),
                    const SizedBox(
                      height: 70,
                    ),
                    const CountDownTimerOTP(),
                    const SizedBox(
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
                    const SizedBox(
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
