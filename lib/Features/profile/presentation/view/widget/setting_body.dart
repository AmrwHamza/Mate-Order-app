import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import '../../../../main home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/text_frame.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: appBarStyle('Your Settings'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFrame(
                  title: tr('Change Language'),
                  icon: Icons.language,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kPrimaryColor9),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.setLocale(const Locale('en'));
                                    Restart.restartApp();
                                  },
                                  child: const Text(
                                    'English',
                                    style: TextStyle(color: Colors.black),
                                  ).tr(),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    context.setLocale(const Locale('ar'));
                                    Restart.restartApp();
                                  },
                                  child: const Text('Arabic',
                                          style: TextStyle(color: Colors.black))
                                      .tr(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                TextFrame(
                  title: tr('Change Theme'),
                  icon: Icons.color_lens_sharp,
                  onTap: () {},
                ),
                const SizedBox(height: 70),
                Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      AssetsData.logoWithoutTitle,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
