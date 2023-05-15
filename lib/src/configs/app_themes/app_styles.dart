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

  static TextStyle h1Header(BuildContext context) {
    return TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2);
  }

  static TextStyle heading1(BuildContext context) {
    return TextStyle(
        fontSize: 32,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2);
  }

  static TextStyle headerH1Medium(BuildContext context) {
    return TextStyle(
        fontSize: 32,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.25,
        letterSpacing: -0.16);
  }

  static TextStyle subHeading(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkChocolate,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2);
  }

  static TextStyle heading2(BuildContext context) {
    return TextStyle(
        fontSize: 20,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2);
  }

  static TextStyle heading2Large(BuildContext context) {
    return TextStyle(
        fontSize: 26,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2);
  }

  static TextStyle headerH1Large(BuildContext context) {
    return TextStyle(
        fontSize: 40,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2,
        letterSpacing: -0.32);
  }

  static TextStyle headerH2Large(BuildContext context) {
    return TextStyle(
        fontSize: 26,
        color: getAppColors(context).white,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.3,
        letterSpacing: -0.16);
  }

  static TextStyle heading2Medium(BuildContext context) {
    return TextStyle(
        fontSize: 20,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.3);
  }

  static TextStyle title1(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.bold,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.2);
  }

  static TextStyle title2(BuildContext context) {
    return TextStyle(
        fontSize: 14,
        color: getAppColors(context).greyMid,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5);
  }

  static TextStyle title2Bold(BuildContext context) {
    return TextStyle(
        fontSize: 14,
        color: getAppColors(context).greyMid,
        fontWeight: FontWeight.w700,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5);
  }

  static TextStyle titleSemiBold(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.w600,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.4);
  }

  static TextStyle titleRegular(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.4,
        letterSpacing: -0.16);
  }

  static TextStyle bodyXSmallSemibold(BuildContext context) {
    return TextStyle(
        fontSize: 12,
        color: getAppColors(context).white,
        fontWeight: FontWeight.w600,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5,
        letterSpacing: -0.16);
  }

   static TextStyle bodyXSmallRegular(BuildContext context) {
    return TextStyle(
        fontSize: 12,
        color: getAppColors(context).white,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5,
        letterSpacing: -0.16);
  }

  static TextStyle bodyXSmallbold(BuildContext context) {
    return TextStyle(
        fontSize: 12,
        color: getAppColors(context).rubyChocolate,
        fontWeight: FontWeight.w700,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5,
        letterSpacing: -0.16);
  }

  static TextStyle bodyTextRegular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: getAppFonts(context).mainFont,
    );
  }

  static TextStyle bodyMediumRelgular(BuildContext context) {
    return TextStyle(
        fontSize: 14,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5,
        letterSpacing: -0.16);
  }

  static TextStyle bodyMediumBold(BuildContext context) {
    return TextStyle(
        fontSize: 14,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.w700,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.5);
  }

  static TextStyle bodyCopy(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: getAppFonts(context).mainFont,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    return TextStyle(
        fontSize: 16,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w700,
        color: getAppColors(context).darkChocolate,
        height: 1.5);
  }

  static TextStyle bodyTextBold(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: getAppColors(context).darkChocolate,
        fontWeight: FontWeight.w600,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.4);
  }

  static BoxShadow dropShadowLightBackground(BuildContext context) {
    return BoxShadow(
      color: getAppColors(context).shadowColor,
      blurRadius: 20,
      offset: const Offset(0, 6),
    );
  }

  static BoxShadow dropShadowCustomKeyboard(BuildContext context) {
    return BoxShadow(
      color: getAppColors(context).shadowColor,
      blurRadius: 20,
      offset: const Offset(0, -6),
    );
  }

  static BoxShadow dropShadowDarkBackground(BuildContext context) {
    return BoxShadow(
      color: getAppColors(context).shadowColorDarkBg,
      blurRadius: 20,
      offset: const Offset(0, 6),
    );
  }

  static BoxShadow dropShadowHomeButton(BuildContext context) {
    return BoxShadow(
      color: getAppColors(context).dropShadow,
      blurRadius: 40,
      offset: const Offset(0, 10),
    );
  }

  static BoxShadow dropShadowDarkBottomPanelBackground(BuildContext context) {
    return BoxShadow(
      color: getAppColors(context).shadowColorDarkBg,
      blurRadius: 40,
      spreadRadius: -10,
      offset: const Offset(0, -2),
    );
  }

  static TextStyle slideButton(BuildContext context) {
    return TextStyle(
      fontFamily: getAppFonts(context).subFont,
      color: getAppColors(context).slideButtonColor,
      fontSize: 14,
    );
  }

  static TextStyle body(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).darkGray,
      fontSize: 14,
      fontFamily: getAppFonts(context).mainFont,
    );
  }

  static TextStyle body2(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkChocolate,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.6);
  }

  static TextStyle bodyBold(BuildContext context) => TextStyle(
        fontSize: 14,
        height: 1.5,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w700,
      );

  static TextStyle numberLarge(BuildContext context) => TextStyle(
        fontSize: 72,
        height: 1.2,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w500,
        color: getAppColors(context).darkChocolate,
      );

  static TextStyle caption1(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkGray,
        fontSize: 12,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w600);
  }

  static TextStyle textlines(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontFamily: getAppFonts(context).mainFont,
      height: 1.245,
    );
  }

  static TextStyle disabledButton(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).greyLightest,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: getAppFonts(context).mainFont, // "Poppins",
    );
  }

  static TextStyle disabledButtonLabelText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: getAppFonts(context).mainFont,
    );
  }

  static TextStyle signUpContent(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkChocolate,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.245);
  }

  static TextStyle loginContent(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkChocolate,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.25);
  }

  static TextStyle placeHolderText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).greyLight,
      fontWeight: FontWeight.w400,
      fontFamily: getAppFonts(context).mainFont,
      fontSize: 16,
    );
  }

  static TextStyle placeHolderDeactiveText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).greyMid,
      fontWeight: FontWeight.w400,
      fontFamily: getAppFonts(context).mainFont,
      fontSize: 16,
    );
  }

  static TextStyle filledText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).darkChocolate,
      fontFamily: getAppFonts(context).mainFont,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.5,
    );
  }

  static TextStyle errorText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).redErrors,
      fontFamily: getAppFonts(context).mainFont,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.5,
    );
  }

  static TextStyle errorMessageHere(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).redErrors,
        fontWeight: FontWeight.w400,
        fontFamily: getAppFonts(context).mainFont,
        fontSize: 13,
        height: 1.5);
  }

  static TextStyle inputLabel(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkChocolate,
        fontSize: 12,
        fontFamily: getAppFonts(context).mainFont,
        height: 18,
        fontWeight: FontWeight.w600);
  }

  static TextStyle helpText(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkGray,
        fontSize: 13,
        fontFamily: getAppFonts(context).mainFont,
        height: 18,
        fontWeight: FontWeight.w600);
  }

  static TextStyle countTimer(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).milkChocolate,
      fontFamily: getAppFonts(context).subFont,
      fontSize: 13,
      height: 1.92,
    );
  }

  static TextStyle pinCodeText(BuildContext context) {
    return TextStyle(
      fontFamily: getAppFonts(context).mainFont,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    );
  }

  static TextStyle pinCodeSmallText(BuildContext context) {
    return TextStyle(
      fontFamily: getAppFonts(context).mainFont,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    );
  }

  static TextStyle didnotReceived(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).expressoChocolate,
        fontSize: 16,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.56,
        letterSpacing: -0.325);
  }

  static TextStyle serviceTitle(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).darkChocolate,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: getAppFonts(context).mainFont,
    );
  }

  static TextStyle textFieldLabelText(BuildContext context) {
    return TextStyle(
        fontFamily: getAppFonts(context).mainFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: getAppColors(context).darkChocolate);
  }

  static TextStyle ckaDescription(BuildContext context) {
    return TextStyle(
        color: getAppColors(context).darkChocolate,
        fontSize: 14,
        fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle alertBoxTitle(BuildContext context) {
    return TextStyle(fontSize: 17, fontFamily: getAppFonts(context).mainFont);
  }

  static TextStyle alertBoxDescription(BuildContext context) {
    return TextStyle(
      fontFamily: getAppFonts(context).mainFont,
      color: getAppColors(context).almostBlack,
      fontSize: 13,
      letterSpacing: -0.08,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle singpassDescriptions(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).milkChocolate,
      fontSize: 13,
      fontFamily: getAppFonts(context).mainFont,
      fontWeight: FontWeight.w400,
      height: 1.36,
    );
  }

  static TextStyle documentEnabledText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).darkChocolate,
      fontFamily: getAppFonts(context).mainFont,
      fontWeight: FontWeight.w700,
      height: 1.5,
      fontSize: 16,
    );
  }

  static TextStyle documentDisabledText(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).greyMid,
      fontFamily: getAppFonts(context).mainFont,
      fontWeight: FontWeight.w700,
      height: 1.5,
      fontSize: 16,
    );
  }

  static TextStyle textLink(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).rubyChocolate,
      fontSize: 16,
      fontFamily: getAppFonts(context).mainFont,
      fontWeight: FontWeight.w700,
      height: 1.5,
    );
  }

  // ignore: inference_failure_on_function_return_type
  static TextStyle bannerDescription(BuildContext context) {
    return TextStyle(
      color: getAppColors(context).darkChocolate,
      fontSize: 14,
      fontFamily: getAppFonts(context).mainFont,
      height: 1.36,
    );
  }

  static TextStyle contentError(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: getAppColors(context).espressoChocolate,
        fontWeight: FontWeight.w600,
        fontFamily: getAppFonts(context).mainFont,
        height: 1.4);
  }

  static TextStyle bodySmall(BuildContext context) => TextStyle(
        fontSize: 13,
        height: 1.5,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.16,
        color: getAppColors(context).almostBlack,
      );

  static TextStyle bodySmallBold(BuildContext context) => TextStyle(
        fontSize: 13,
        height: 1.5,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.16,
        color: getAppColors(context).rubyChocolate,
      );

  static TextStyle bodySmallRegular(BuildContext context) => TextStyle(
        fontSize: 13,
        height: 1.5,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w400,
        color: getAppColors(context).darkChocolate,
      );

  static TextStyle bodyLargeRegular(BuildContext context) {
    return TextStyle(
        fontSize: 16,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w400,
        color: getAppColors(context).darkChocolate,
        letterSpacing: -0.16,
        height: 1.5);
  }

  static TextStyle bodyLargeBold(BuildContext context) => TextStyle(
        fontSize: 16,
        height: 1.5,
        fontFamily: getAppFonts(context).mainFont,
        fontWeight: FontWeight.w700,
        color: getAppColors(context).rubyChocolate,
      );
}
