import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/Features/Nonification/data/models/notifications_modul.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });
  final NOtification notification;
  @override
  Widget build(BuildContext context) {
    final DateTime parsedDate = DateTime.parse(notification.createdAt!);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: MediaQuery.of(context).size.width * .8,
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: kPrimaryColor6,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 2),
            color: Colors.black26,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  notification.data!.message!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kPrimaryColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CircleAvatar(
                      maxRadius: 12,
                      backgroundColor: kPrimaryColor4,
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Text(
                      '${DateFormat('hh:mm a').format(parsedDate)}  ${DateFormat('yyyy/MM/dd').format(parsedDate)}',
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
