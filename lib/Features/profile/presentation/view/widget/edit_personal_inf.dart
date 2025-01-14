import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_inf_cubit/profile_inf_cubit.dart';
import 'package:mate_order_app/core/widgets/widget/cancel_button.dart';
import 'package:mate_order_app/floating_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../main home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/align_of_comments.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/check_botton.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/editable_text_field.dart';
import 'package:mate_order_app/constants.dart';

class EditPersonalInf extends StatelessWidget {
  EditPersonalInf({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfCubit()..showPersonalInf(),
      child: BlocConsumer<ProfileInfCubit, ProfileInfState>(
        listener: (context, state) {
          if (state is ProfileUpdateInfSuccess) {
            Navigator.pop(context);

            FloatingMessage('Profile information has been updated successfuly ',
                1, context);
          }
        },
        builder: (context, state) {
          if (state is ProfileInfFailure) {
            FloatingMessage(state.error, 3, context);
          } else if (state is ProfileGetInfSuccess) {
            firstNameController.text = state.profileInfModel.firstName;
            lastNameController.text = state.profileInfModel.lastName;
            emailController.text = state.profileInfModel.email;
            phoneController.text = state.profileInfModel.phoneNumber;
          }

          return ModalProgressHUD(
            inAsyncCall: context.read<ProfileInfCubit>().isLoading,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: KBackgroundColor,
                appBar: appBarStyle('Edit Your Profile'),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      AlignOfComments(comment: 'Press to edit your name'.tr()),
                      const SizedBox(height: 10),
                      EditableTextField(
                        label: 'First Name'.tr(),
                        icon: Icons.account_circle_outlined,
                        controller: firstNameController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      EditableTextField(
                        label: 'Last Name'.tr(),
                        icon: Icons.account_circle_outlined,
                        controller: lastNameController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 30),
                      AlignOfComments(comment: 'Press to edit your email'.tr()),
                      const SizedBox(height: 10),
                      EditableTextField(
                        label: 'Email'.tr(),
                        icon: Icons.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      AlignOfComments(
                          comment: 'Press to edit your phone number'.tr()),
                      const SizedBox(height: 10),
                      EditableTextField(
                        label: 'Phone Number'.tr(),
                        icon: Icons.phone,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 55),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CancelButton(),
                          IconButton(
                            onPressed: () {
                              if (firstNameController.text.trim().isEmpty ||
                                  lastNameController.text.trim().isEmpty ||
                                  emailController.text.trim().isEmpty ||
                                  phoneController.text.trim().isEmpty) {
                                FloatingMessage(
                                    'Some fields are empty. All fields will be updated.'
                                        .tr(),
                                    3,
                                    context);
                              }

                              context.read<ProfileInfCubit>().updatePersonalInf(
                                    firstNameController.text.trim(),
                                    lastNameController.text.trim(),
                                    emailController.text.trim(),
                                    phoneController.text.trim(),
                                  );
                            },
                            icon: const CheckBotton(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
