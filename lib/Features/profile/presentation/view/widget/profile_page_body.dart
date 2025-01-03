import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/auth/login/presentation/views/login_view.dart';
import 'package:mate_order_app/Features/auth/logout/presentation/view_model/cubit/logout_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/change_password_botton.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/edit_personal_inf.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/history_button.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/image_circle.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/my_favorite_button.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/my_location_button.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/personal_info.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/setting_botton.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_image_cubit/profile_image_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_inf_cubit/profile_inf_cubit.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';
import 'package:mate_order_app/core/utils/assets.dart';
import 'package:mate_order_app/floating_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  Future<void> refresh(BuildContext context) async {
    context.read<ProfileInfCubit>().showPersonalInf();
    context.read<ProfileImageCubit>().showImage();

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LogoutCubit(),
        child: BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) async {
            if (state is LogoutLoading) {
              BlocProvider.of<LogoutCubit>(context).isLoading = true;
            } else if (state is LogoutSuccess) {
              BlocProvider.of<LogoutCubit>(context).isLoading = false;
              await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
              Get.offAll(() => const LoginView());
            } else if (state is LogoutFailure) {
              BlocProvider.of<LogoutCubit>(context).isLoading = false;
              FloatingMessage('Error: ${state.error}', 3, context);
            }
          },
          builder: (context, state) {
            return RefreshIndicator(
              color: kPrimaryColor4,
              onRefresh: () => refresh(context),
              child: ModalProgressHUD(
                inAsyncCall: BlocProvider.of<LogoutCubit>(context).isLoading,
                blur: .5,
                progressIndicator: const CircularProgressIndicator(
                  color: kPrimaryColor2,
                ),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                   Form(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              ImageCircle(),
                              const SizedBox(width: 30),
                              PersonalInfo(),
                              // const SizedBox(width: 10),
                              IconButton(
                                  onPressed: () {
                                    Get.to(
                                      () => EditPersonalInf(),
                                      duration: KTransitionDuration,
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  const MyFavoriteButton(),
                                  const SizedBox(height: 10),
                                  const MyLocationButton(),
                                  const SizedBox(height: 10),
                                  const HistoryButton(),
                                  const SizedBox(height: 10),
                                  const ChangePasswordBotton(),
                                  const SizedBox(height: 10),
                                  const SettingBotton(),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.confirm,
                                        title: 'Log Out',
                                        text:
                                            'Are you sure you want to log out?',
                                        cancelBtnText: 'No',
                                        confirmBtnText: ' Yes',
                                        confirmBtnColor: kPrimaryColor2,
                                        onCancelBtnTap: () =>
                                            Navigator.pop(context),
                                        onConfirmBtnTap: () {
                                          Navigator.of(context).pop();
                                          BlocProvider.of<LogoutCubit>(context)
                                              .logout('auth/logout');
                                        },
                                      );
                                    },
                                    child: const ListTile(
                                      title: Text('Log Out'),
                                      trailing: Icon(Icons.chevron_right),
                                      leading: Icon(Icons.exit_to_app,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Opacity(
                                opacity: 0.2,
                                child: Image.asset(AssetsData.logoWithoutTitle),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        ));
  }
}
