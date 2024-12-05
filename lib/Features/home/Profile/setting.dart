import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/home/Profile/widget/text_frame.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor4,
        title: Text(
          'Your Setting',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFrame(
                  title: 'change Language',
                  icon: Icons.language,
                  onTap: () {},
                ),
                SizedBox(height: 10),
                TextFrame(
                  title: 'Change Theme',
                  icon: Icons.color_lens_sharp,
                  onTap: () {},
                ),
                SizedBox(height: 70),
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
