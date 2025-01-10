// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class BottomSheett extends StatelessWidget {
  const BottomSheett(
      {super.key,
      required this.seeProfile,
      required this.setProfile,
      required this.deleteProfile});

  final GestureTapCallback seeProfile;
  final GestureTapCallback setProfile;
  final GestureTapCallback deleteProfile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Wrap(
      children: [
        ListTile(
          tileColor: KBackgroundColor,
          leading: const Icon(Icons.visibility),
          title: const Text('See profile picture'),
          onTap: seeProfile,
        ),
        ListTile(
          tileColor: KBackgroundColor,
          leading: const Icon(Icons.photo_camera),
          title: const Text('Select the profile'),
          onTap: setProfile,
        ),
        ListTile(
          tileColor: KBackgroundColor,
          leading: const Icon(Icons.delete),
          title: const Text('Delete profile picture'),
          onTap: deleteProfile,
        )
      ],
    ));
  }
}
