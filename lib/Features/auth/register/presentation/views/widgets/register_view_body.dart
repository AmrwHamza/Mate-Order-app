import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/otp_view.dart';
import 'package:mate_order_app/Features/auth/login/presentation/views/login_view.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_text_form_field.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/register_text.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/show_snack_bar.dart';
import 'package:mate_order_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          BlocProvider.of<RegisterCubit>(context).isLoading = false;
          showSnackBar(context, state.error);
        } else if (state is RegisterSuccess) {
          BlocProvider.of<RegisterCubit>(context).isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const OTPView();
            },
          ));
        } else if (state is RegisterLoading) {
          BlocProvider.of<RegisterCubit>(context).isLoading = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: BlocProvider.of<RegisterCubit>(context).isLoading,
          child: Form(
            key: keyForm,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  const Logo(),
                  const RegisterOrLogInText(
                    data: 'Register',
                  ),
                  const Divider(
                    color: kPrimaryColor1,
                    indent: 27,
                    endIndent: 27,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      BlocProvider.of<RegisterCubit>(context).firstName = p0;
                    },
                    label: const Text('First Name',
                        style: TextStyle(color: Colors.blueGrey)).tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.account_circle_outlined),
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      BlocProvider.of<RegisterCubit>(context).lastName = p0;
                    },
                    label: const Text('Last Name',
                        style: TextStyle(color: Colors.blueGrey)).tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.account_circle_outlined),
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      BlocProvider.of<RegisterCubit>(context).phoneNumber =
                          '+963$p0';

                    },
                    label: const Text(
                      'Phone Number',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      } else if (!value.startsWith('9') || value.length != 9) {
                        return "wrong number it must be like 9xxxxxxxx";
                      }
                      return null;
                    },
                    prefixText: '+963',
                    hintText: '9xxxxxxxx',
                    suffixIcon: const Icon(Icons.phone_android_outlined),
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      BlocProvider.of<RegisterCubit>(context).email = p0;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      } else if (!value.endsWith('@gmail.com')) {
                        return "It must end with @gmail.com";
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.email_outlined),
                    label: const Text('Email',
                        style: TextStyle(color: Colors.blueGrey)),
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      BlocProvider.of<RegisterCubit>(context).password = p0;
                    },
                    label: const Text('Password',
                        style: TextStyle(color: Colors.blueGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      } else if (value.length < 8) {
                        return "at least 8 characters";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      child: Icon(context.watch<RegisterCubit>().eyeIcon),
                      onTap: () {
                        BlocProvider.of<RegisterCubit>(context).isobsecure();
                      },
                    ),
                    obscureText: context.watch<RegisterCubit>().isObsecure,
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      BlocProvider.of<RegisterCubit>(context).confirmPassword =
                          p0;
                    },
                    label: const Text('Confirm Password',
                        style: TextStyle(color: Colors.blueGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      } else if (value.length < 8) {
                        return "at least 8 characters";
                      } else if (value !=
                          BlocProvider.of<RegisterCubit>(context).password) {
                        return "not the same passowrd";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      child: Icon(context.watch<RegisterCubit>().eyeIcon),
                      onTap: () {
                        BlocProvider.of<RegisterCubit>(context).isobsecure();
                      },
                    ),
                    obscureText: context.watch<RegisterCubit>().isObsecure,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomRegisterButton(
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        BlocProvider.of<RegisterCubit>(context)
                            .onTapRegisterButton();
                      }
                    },
                    data: 'Send verification code',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      GestureDetector(
                        onTap: () => Get.off(const LoginView()),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: kPrimaryColor5),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
