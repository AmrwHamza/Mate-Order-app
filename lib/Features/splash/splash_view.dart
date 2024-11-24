import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static String id = 'Splash View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetsData.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 450,
          ),
          Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 600,
                    decoration: const BoxDecoration(
                      color: KBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsData.logo,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                          const Text(
                            'MATE ORDER',
                            style: TextStyle(
                              color: kPrimaryColor2,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Your best order application',
                            style: TextStyle(
                              color: kPrimaryColor2,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'When placing an order, select the option "order now" and your order will be ready on its way.',
                            style: TextStyle(
                              fontSize: 14,
                              color: kPrimaryColor2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              print('TTTTT');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: const Size(double.infinity, 60),
                            ),
                            child: Text(
                              'ORDER NOW',
                              style: TextStyle(
                                  color: kPrimaryColor2.withOpacity(.8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'DISMISS',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
