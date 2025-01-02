import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/logout/presentation/view_model/cubit/logout_cubit.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/profile_page_body.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_image_cubit/profile_image_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_inf_cubit/profile_inf_cubit.dart';
import 'package:mate_order_app/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogoutCubit>(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider<ProfileImageCubit>(
          create: (context) => ProfileImageCubit(),
        ),
        BlocProvider<ChangePasswordCubit>(
          create: (context) => ChangePasswordCubit(),
        ),
        BlocProvider<ProfileInfCubit>(
          create: (context) => ProfileInfCubit()..showPersonalInf(),
        ),
      ],
      child: Scaffold(
        backgroundColor: KBackgroundColor,
        appBar: MainAppBar('Your Profile'),
        body: ProfilePageBody(),
      ),
    );
  }
}
