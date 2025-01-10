import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mate_order_app/Features/Nonification/presentation/model_view/cubit/notifications_cubit_cubit.dart';
import 'package:mate_order_app/Features/Nonification/presentation/view/notification_card.dart';
import 'package:mate_order_app/constants.dart';

import '../../../../core/utils/assets.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      height: 60,
      showChildOpacityTransition: false,
      backgroundColor: Colors.white,
      color: kPrimaryColor4,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: () async {
        context.read<NotificationsCubit>().getNotifications();
      },
      child: BlocBuilder<NotificationsCubit, NotificationsCubitState>(
        builder: (context, state) {
          if (state is NotificationsCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NotificationsCubitSuccess) {
            return ListView.builder(
              itemCount: state.notificationsModul.notifications?.length,
              itemBuilder: (context, index) {
                return NotificationCard(
                  notification: state.notificationsModul.notifications![index],
                );
              },
            );
          } else {
            return ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(60),
                    child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(AssetsData.noNotification)),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
