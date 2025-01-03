import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/bottom_sheet.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_image_cubit/profile_image_cubit.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/floating_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class ImageCircle extends StatelessWidget {
  File? serverImage;

  ImageCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileImageCubit>(
      create: (context) => ProfileImageCubit()..showImage(),
      child: BlocConsumer<ProfileImageCubit, ProfileImageState>(
        listener: (context, state) {
          if (state is ProfileImageShowSuccess) {
            serverImage = state.imageData;
          } else if (state is ProfileImageUpdateSuccess) {
            FloatingMessage(
                'Profile Change Successfuly , Wait for load your image ',
                1,
                context);
            context.read<ProfileImageCubit>().showImage();
          } else if (state is ProfileImageDelSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.read<ProfileImageCubit>().showImage();
          } else if (state is ProfileImageUpdateFailure) {
            FloatingMessage(
                'Unable to change your profile picture', 3, context);
          } else if (state is ProfileImageShowFailure) {
            FloatingMessage(state.message, 3, context);
          } else if (state is ProfileImageDelFailure) {
            FloatingMessage(
                'Unable to delete your profile picture', 3, context);
          }
        },
        builder: (context, state) {
          Widget profileWidget = serverImage == null
              ? const CircleAvatar(
                  radius: 50,
                  backgroundColor: kPrimaryColor9,
                  child: Icon(Icons.person, size: 70, color: kPrimaryColor4),
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(serverImage!),
                );
          if (state is ProfileImageDelSuccess) {
            serverImage = null;
          }
          if (state is ProfileImageShowFailure) {
            profileWidget = const CircleAvatar(
              radius: 50,
              backgroundColor: kPrimaryColor9,
              child: Icon(Icons.person, size: 70, color: kPrimaryColor4),
            );
          }

          return SizedBox(
            height: 100,
            width: 100,
            child: ModalProgressHUD(
              progressIndicator: const CircularProgressIndicator(
                color: kPrimaryColor4,
                backgroundColor: KBackgroundColor,
              ),
              color: KBackgroundColor,
              inAsyncCall: context.read<ProfileImageCubit>().isLoading,
              
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return BottomSheett(
                        seeProfile: () {
                          Navigator.pop(context);
                          viewProfilePicture(context);
                        },
                        setProfile: () {
                          Navigator.pop(context);
                          pickImage(context);
                        },
                        deleteProfile: () {
                          Navigator.pop(context);
                          deleteProfilePicture(context);
                        },
                      );
                    },
                  );
                },
                child: Stack(
                  children: [
                    profileWidget,
                    Positioned(
                      right: 1,
                      bottom: 1,
                      child: CircleAvatar(
                        backgroundColor: kPrimaryColor2,
                        radius: 14,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 12,
                          child: const Icon(
                            Icons.edit,
                            color: kPrimaryColor4,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void deleteProfilePicture(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Profile Picture'),
          content:
              const Text('Are you sure you want to delete your profile picture?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No', style: TextStyle(color: kPrimaryColor4)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (serverImage != null) {
                  serverImage = null;
                  context.read<ProfileImageCubit>().deleteImage();
                } else {
                  FloatingMessage('No profile picture to delete.', 4, context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor2,
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final croppedImage = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: kPrimaryColor4,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: false,
            ),
            IOSUiSettings(title: 'Crop Image'),
          ],
        );
        if (croppedImage != null) {

          if (context.mounted) {

            context
                .read<ProfileImageCubit>()
                .updateImage(File(croppedImage.path));
          }
        }
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      FloatingMessage('$e', 3, context);
    }
  }

  void viewProfilePicture(BuildContext context) {
    if (serverImage != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Profile Picture'),
          content: Image.file(serverImage!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(color: kPrimaryColor2),
              ),
            ),
          ],
        ),
      );
    } else {
      FloatingMessage('You don\'t have a profile picture', 4, context);
    }
  }
}
