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

  static TextStyle headerMediumBold(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle titleMediumBold(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle titleMediumRegular(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle titleSmallRegular(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.normal,
        fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle titleLargeBold(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        letterSpacing: -0.16,
        height: 1.25);
  }

  static TextStyle titleLargeRegular(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.normal,
        fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle titleMediumItalic(BuildContext context) {
    return TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.normal,
        fontFamily: getAppFonts(context).mainFont);
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
