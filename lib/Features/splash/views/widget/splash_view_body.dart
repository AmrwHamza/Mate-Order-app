import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/splash/views/first_page.dart';
import 'package:mate_order_app/Features/splash/views/widget/sliding_text.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  late AnimationController imageAnimationController;
  late Animation<double> imageAnimation;

  late AnimationController textAnimationController;
  late Animation<double> textFadeAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initImageAnimation();
    initTextAnimation();

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const FirstPage(),
          transition: Transition.fade, duration: KTransitionDuration);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    imageAnimationController.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
            opacity: imageAnimation,
            child: Image.asset(AssetsData.logoWithoutTitle)),
        SlidingText(
          slidingAnimation: slidingAnimation,
          textFadeAnimation: textFadeAnimation,
        )
      ],
    );
  }


  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void initImageAnimation() {
    imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    imageAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(imageAnimationController);
    imageAnimationController.forward();
  }

  void initTextAnimation() {
    textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    textFadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(textAnimationController);
    textAnimationController.forward();
  }
}
