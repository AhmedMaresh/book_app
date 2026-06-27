import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Image.asset(AssetsData.logo, height: 22),
            const Spacer(),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouters.kSearchView);
              },
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
