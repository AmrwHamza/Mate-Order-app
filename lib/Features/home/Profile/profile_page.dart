import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mate_order_app/Features/home/Profile/edit_personal_inf.dart';
import 'package:mate_order_app/Features/home/Profile/setting.dart';
import 'package:mate_order_app/Features/home/Profile/update_your_profile.dart';
import 'package:mate_order_app/Features/home/Profile/widget/menu_option.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  XFile? profileImage;
  late AnimationController _animationController;
  late OverlayState? _overlayState;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayState = Overlay.of(context, rootOverlay: true);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor4,
        centerTitle: true,
        title: const Text(
          "Your Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showOptionOfProfile(context);
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: kPrimaryColor9,
                        backgroundImage: profileImage != null
                            ? FileImage(File(profileImage!.path))
                            : null,
                        child: profileImage == null
                            ? const Icon(
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
                            child: const Icon(
                              Icons.edit,
                              color: kPrimaryColor4,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Name',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'email@gmail.com',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF8D8D8D),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {
                      Get.to(() => const EditPersonalInf(),
                          transition: Transition.fade,
                          duration: KTransitionDuration);
                    },
                    icon: const Icon(Icons.edit)),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                Column(
                  children: [
                    MenuOption(
                      icon: Icons.favorite,
                      text: 'My Favorite',
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    MenuOption(
                      icon: Icons.location_on,
                      text: 'My Location',
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    MenuOption(
                      icon: Icons.calendar_month,
                      text: 'History',
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    MenuOption(
                      icon: FontAwesomeIcons.lock,
                      text: 'Change Password',
                      onTap: () {
                        Get.to(() => const UpdateYourProfile(),
                            transition: Transition.fade,
                            duration: KTransitionDuration);
                      },
                    ),
                    const SizedBox(height: 10),
                    MenuOption(
                      icon: Icons.settings,
                      text: 'Setting',
                      onTap: () {
                        Get.to(() => const Setting(),
                            transition: Transition.fade,
                            duration: KTransitionDuration);
                      },
                    ),
                    const SizedBox(height: 10),
                    MenuOption(
                      icon: Icons.exit_to_app,
                      text: 'Sign Out',
                      onTap: () {},
                    ),
                  ],
                ),
                Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      AssetsData.logoWithoutTitle,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showOptionOfProfile(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                tileColor: KBackgroundColor,
                leading: const Icon(Icons.visibility),
                title: const Text('See profile picture'),
                onTap: () {
                  //اريد اضافة شرط بحيث اذا كان هناك بروفايل يجعل قيمة hasProfilePicture , true
                  bool hasProfilePicture = profileImage != null;
                  Navigator.pop(context);
                  if (!hasProfilePicture) {
                    showFloatingNotification(
                        context, 'You don\'t have profile picture');
                  } else {
                    viewProfilePicture(context);
                  }
                },
              ),
              ListTile(
                  tileColor: KBackgroundColor,
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Select the profile'),
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(context);
                  }),
              ListTile(
                  tileColor: KBackgroundColor,
                  leading: const Icon(Icons.delete),
                  title: const Text('Delete profile picture'),
                  onTap: () {
                    Navigator.pop(context);
                    deleteProfilePicture(context);
                  })
            ],
          ));
        });
  }

  void deleteProfilePicture(BuildContext context) {
    setState(() {
      profileImage = null;
    });
    showFloatingNotification(context, 'Profile picture deleted');
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
                lockAspectRatio: true),
            IOSUiSettings(
              title: 'Crop Image',
            ),
          ],
        );
        if (croppedImage != null) {
          setState(() {
            profileImage = XFile(croppedImage.path);

            if (mounted) {
              Future.delayed(const Duration(milliseconds: 100));
              showFloatingNotification(
                  context, ' Profile changed successfully');
            }
          });
        }
      }
    } on Exception catch (e) {
      print(' Error picking or cropping image: $e');
      showFloatingNotification(context, 'Error picking or cropping image');
    }
  }

  void viewProfilePicture(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Profile Picture'),
              content: profileImage != null
                  ? Image.file(File(profileImage!.path))
                  : Image.asset(AssetsData.logo),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'))
              ],
            ));
  }

  void showFloatingNotification(BuildContext context, String message) {
    if (!mounted) return;
    if (_overlayState == null || !mounted) return;
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 200,
        left: MediaQuery.of(context).size.width / 2 - 100,
        child: Material(
          color: Colors.transparent,
          child: FadeTransition(
            opacity: _animationController,
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    _overlayState?.insert(overlayEntry);

    _animationController.forward().then((value) async {
      await Future.delayed(const Duration(seconds: 2));
      _animationController.reverse().then((value) {
        overlayEntry.remove();
      });
    });
  }
}
