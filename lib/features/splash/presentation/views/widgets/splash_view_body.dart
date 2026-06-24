import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController textController;
  late AnimationController logoController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> slidingAnimationLogo;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initSlidingLogo();
    navigateToHome();
  }

  @override
  void dispose() {
    textController.dispose();
    logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingLogo(slidingAnimationLogo: slidingAnimationLogo),
        const SizedBox(height: 10),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingLogo() {
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimationLogo = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(logoController);

    logoController.forward();
  }

  void initSlidingAnimation() {
    textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(textController);

    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });

    textController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => HomeView(),
        transition: Transition.fadeIn,
        duration: kDurationTranstion,
      );
    });
  }
}
