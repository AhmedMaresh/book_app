import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class FeaturedListViewImageItem extends StatelessWidget {
  const FeaturedListViewImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.testImage),
          ),
        ),
      ),
    );
  }
}
