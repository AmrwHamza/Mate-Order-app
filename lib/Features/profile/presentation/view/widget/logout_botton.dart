import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/logout/presentation/view_model/cubit/logout_cubit.dart';
import 'package:mate_order_app/constants.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: 'Log Out'.tr(),
          text: 'Are you sure you want to log out?'.tr(),
          cancelBtnText: 'No',
          confirmBtnText: ' Yes',
          confirmBtnColor: kPrimaryColor2,
          onCancelBtnTap: () => Navigator.pop(context),
          onConfirmBtnTap: () {
            Navigator.of(context).pop();
            BlocProvider.of<LogoutCubit>(context).logout('auth/logout');
          },
        );
      },
      child:  ListTile(
        title: const Text('Log Out').tr(),
        trailing: const Icon(Icons.chevron_right),
        leading: const Icon(Icons.exit_to_app, color: Colors.black),
      ),
    );
  }
}
