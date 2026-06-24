import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({super.key, required this.slidingAnimationLogo});

  final Animation<Offset> slidingAnimationLogo;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimationLogo,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimationLogo,
          child: Image.asset(AssetsData.logo),
        );
      },
    );
  }
}
