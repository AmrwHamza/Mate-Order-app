import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/view-models/cubit/verify_cubit.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/custom_text_field_o_t_p.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/first%20page/view/widget/custom_botton.dart';
import 'package:mate_order_app/Features/home/home_page/home_page.dart';
import 'package:mate_order_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OTPViewBody extends StatelessWidget {
  const OTPViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifyLoading) {
          BlocProvider.of<VerifyCubit>(context).isLoading = true;
        } else if (state is VerifyFailure) {
          showSnackBar(context, state.error);
        } else if (state is VerifySuccess) {
          Get.to(HomePage());
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: context.watch<VerifyCubit>().isLoading,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextFieldOTP(
                      first: true,
                      last: false,
                      controller: c1,
                    ),
                    CustomTextFieldOTP(
                      first: false,
                      last: false,
                      controller: c2,
                    ),
                    CustomTextFieldOTP(
                      first: false,
                      last: false,
                      controller: c3,
                    ),
                    CustomTextFieldOTP(
                      first: false,
                      last: false,
                      controller: c4,
                    ),
                    CustomTextFieldOTP(
                      first: false,
                      last: false,
                      controller: c5,
                    ),
                    CustomTextFieldOTP(
                      first: false,
                      last: true,
                      controller: c6,
                    ),
                  ],
                ),
                CustomRegisterButton(
                  data: 'Confirm',
                  onPressed: () {
                    BlocProvider.of<VerifyCubit>(context).verifyClick(
                        token: context.read<RegisterCubit>().user!.token!);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void dispose() {
    print('dispose');
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
  }
}
