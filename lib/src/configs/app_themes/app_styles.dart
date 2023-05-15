import 'package:flutter/material.dart';

import 'app_themes.dart';

@immutable
class AppStyles {
  static AppFonts getAppFonts(BuildContext context) {
    return Theme.of(context).extension<AppFonts>()!;
  }

  static AppColors getAppColors(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }

  // static TextStyle headerH1Medium(BuildContext context) {
  //   return TextStyle(
  //       fontSize: 32,
  //       color: getAppColors(context).darkChocolate,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: getAppFonts(context).mainFont,
  //       height: 1.25,
  //       letterSpacing: -0.16);
  // }
}
