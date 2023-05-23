import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../components/button/icon_button.dart';
import '../../../../../configs/app_themes/app_themes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key,
      required this.height,
      required this.onTapLeading,
      required this.onTapTrailing});
  final double height;
  final VoidCallback onTapLeading;
  final VoidCallback onTapTrailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: const Icon(Icons.account_circle,
                  size: 32, color: Colors.white),
              onTap: onTapLeading,
            ),
            Text(
              'home.title'.tr(),
              style: AppStyles.headerMediumBold(context),
            ),
            CustomIconButton(
              icon: const Icon(
                Icons.menu,
                size: 32,
                color: Colors.white,
              ),
              onTap: onTapTrailing,
            ),
          ],
        ),
      ),
    );
  }
}
