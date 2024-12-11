import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mate_order_app/constants.dart';

class CircleOfProfile extends StatelessWidget {
  const CircleOfProfile({
    super.key,
    required this.profileImage,
  });

  final XFile? profileImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: kPrimaryColor9,
          backgroundImage: profileImage != null
              ? FileImage(File(profileImage!.path))
              : null,
          child: profileImage == null
              ? Icon(
                  Icons.person,
                  size: 70,
                  color: kPrimaryColor4,
                )
              : null,
        ),
        Positioned(
          right: 1,
          bottom: 1,
          child: CircleAvatar(
            backgroundColor: kPrimaryColor2,
            radius: 14,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 12,
              child: Icon(
                Icons.edit,
                color: kPrimaryColor4,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}