import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/check_botton.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/password_field_frame.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/widgets/widget/cancel_button.dart';
import 'package:mate_order_app/floating_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../main home/widget/app_bar_style.dart';

class ChangePasswordBody extends StatelessWidget {
  final TextEditingController cureentController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            FloatingMessage(state.message, 1, context);
            Navigator.pop(context);
          } else if (state is ChangePasswordFailure) {
            FloatingMessage('Error: ${state.error}', 4, context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall:
                BlocProvider.of<ChangePasswordCubit>(context).isLoading,
            blur: .5,
            progressIndicator: const CircularProgressIndicator(
              color: kPrimaryColor2,
            ),
            child: Scaffold(
              // backgroundColor: KBackgroundColor,
              appBar: appBarStyle('Edit Your Profile'),
              body: Padding(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 25, bottom: 14),
                child: ListView(
                  children: [
                    const SizedBox(height: 5),
                    PasswordFieldFrame(
                      label: 'Current Password'.tr(),
                      controller: cureentController,
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(height: 5),
                    PasswordFieldFrame(
                      label: 'New Password'.tr(),
                      controller: newController,
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(height: 5),
                    PasswordFieldFrame(
                      label: 'Confirm Your Password'.tr(),
                      controller: confirmController,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CancelButton(),
                        IconButton(
                          onPressed: () {
                            validatePassword(context);
                          },
                          icon: const CheckBotton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void validatePassword(BuildContext context) {
    final oldPassword = cureentController.text;
    final newPassword = newController.text;
    final confirmPassword = confirmController.text;

    if (newPassword != confirmPassword) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'New passwords do not match');
    }
    BlocProvider.of<ChangePasswordCubit>(context)
        .changePassword('updatePassword', {
      'current_password': oldPassword,
      'password': newPassword,
      'confirmation_password': confirmPassword,
    });
  }
}
