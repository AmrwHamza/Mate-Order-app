import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/login/presentation/view-models/cubit/login_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_text_form_field.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/register_text.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/show_snack_bar.dart';
import 'package:mate_order_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final keyForm = GlobalKey<FormState>();

  bool isLoading = false;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showSnackBar(context, state.error);
        }
        if (state is LoginLoading) ;
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Logo(),
                RegisterOrLogInText(
                  data: 'Login',
                ),
                Divider(
                  color: kPrimaryColor1,
                  indent: 27,
                  endIndent: 27,
                ),
                CustomTextFormField(
                  onChanged: (p0) {
                    context = '+963$p0';
                    print('=================================');
                    print('+963$p0');

                    print('================================');
                  },
                  label: Text(
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
                  suffixIcon: Icon(Icons.phone_android_outlined),
                  keyboardType: TextInputType.number,
                ),
                CustomTextFormField(
                  onChanged: (p0) {
                    password = p0;
                  },
                  label: Text('Password',
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
                    // child: Icon(context.watch<RegisterCubit>().eyeIcon),
                    child: Icon(Icons.remove_red_eye_outlined),

                    onTap: () {
                      // BlocProvider.of<RegisterCubit>(context).isobsecure();
                    },
                  ),
                  obscureText: isObscure,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomRegisterButton(
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      print('==================');
                      print('done validation');
                      print('==================');
                      BlocProvider.of<LoginCubit>(context).onTapLoginButton();
                    }
                  },
                  data: 'Send verification code',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
