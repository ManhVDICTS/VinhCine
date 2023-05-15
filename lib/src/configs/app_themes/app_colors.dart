import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.darkChocolate,
    required this.rubyChocolate,
    required this.espressoChocolate,
    required this.milkChocolate,
    required this.whiteChocolate,
    required this.greenSuccess,
    required this.redErrors,
    required this.black,
    required this.white,
    required this.almostWhite,
    required this.darkGray,
    required this.greyMid,
    required this.greyLight,
    required this.greyLightest,
    required this.shadowColor,
    required this.shadowColorDarkBg,
    required this.systemBlue,
    required this.paleChocolate,
    required this.dropShadow,
    required this.gradientRuby0,
    required this.gradientRuby1,

    // Not in Figma
    required this.lightTextColor,
    required this.buttonShadowColor,
    required this.slideButtonColor,
    required this.textLineColor,
    required this.checkBoxOutlineColor,
    required this.expressoChocolate,
    required this.almostBlack,
    required this.lightWhiteChocolate,
    required this.lightestWhiteChocolate,
    required this.scaffoldBackgroundColor,
    required this.bannerSuccess,
    required this.bannerError,
    required this.singpassColor,
    required this.roseTint,
    required this.darkGray1,
  });
  // Available in Figma
  final Color darkChocolate;
  final Color rubyChocolate;
  final Color paleChocolate;
  final Color espressoChocolate;
  final Color milkChocolate;
  final Color whiteChocolate;
  final Color greenSuccess;
  final Color redErrors;
  final Color black;
  final Color white;
  final Color almostWhite;
  final Color darkGray;
  final Color greyMid;
  final Color greyLight;
  final Color greyLightest;
  final Color shadowColor;
  final Color shadowColorDarkBg;
  final Color systemBlue;
  final Color dropShadow;
  final Color gradientRuby0;
  final Color gradientRuby1;

  // Missing in Figma Color Pallete
  final Color scaffoldBackgroundColor;
  final Color lightTextColor;
  final Color buttonShadowColor;
  final Color slideButtonColor;
  final Color textLineColor;
  final Color checkBoxOutlineColor;
  final Color expressoChocolate;
  final Color almostBlack;
  final Color lightWhiteChocolate;
  final Color lightestWhiteChocolate;
  final Color bannerSuccess;
  final Color bannerError;
  final Color singpassColor;
  final Color roseTint;
  final Color darkGray1;

  @override
  AppColors copyWith(
      {Color? scaffoldBackgroundColor,
      Color? darkChocolate,
      Color? lightTextColor,
      Color? greyLight,
      Color? rubyChocolate,
      Color? white,
      Color? milkChocolate,
      Color? darkGray,
      Color? shadowColor,
      Color? shadowColorDarkBg,
      Color? buttonShadowColor,
      Color? slideButtonColor,
      Color? whiteChocolate,
      Color? textLineColor,
      Color? checkBoxOutlineColor,
      Color? redErrors,
      Color? greyMid,
      Color? expressoChocolate,
      Color? almostBlack,
      Color? lightWhiteChocolate,
      Color? greenSuccess,
      Color? almostWhite,
      Color? lightestWhiteChocolate,
      Color? greyLightest,
      Color? espressoChocolate,
      Color? black,
      Color? bannerError,
      Color? bannerSuccess,
      Color? singpassColor,
      Color? roseTint,
      Color? systemBlue,
      Color? darkGray1,
      Color? dropShadow,
      Color? gradientRuby0,
      Color? gradientRuby1}) {
    return AppColors(
        scaffoldBackgroundColor:
            scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
        darkChocolate: darkChocolate ?? this.darkChocolate,
        paleChocolate: darkChocolate ?? this.darkChocolate,
        lightTextColor: lightTextColor ?? this.lightTextColor,
        greyLight: greyLight ?? this.greyLight,
        rubyChocolate: rubyChocolate ?? this.rubyChocolate,
        white: white ?? this.white,
        milkChocolate: milkChocolate ?? this.milkChocolate,
        darkGray: darkGray ?? this.darkGray,
        shadowColor: shadowColor ?? this.shadowColor,
        shadowColorDarkBg: shadowColorDarkBg ?? this.shadowColorDarkBg,
        buttonShadowColor: buttonShadowColor ?? this.buttonShadowColor,
        slideButtonColor: slideButtonColor ?? this.slideButtonColor,
        whiteChocolate: whiteChocolate ?? this.whiteChocolate,
        textLineColor: textLineColor ?? this.textLineColor,
        checkBoxOutlineColor: checkBoxOutlineColor ?? this.checkBoxOutlineColor,
        redErrors: redErrors ?? this.redErrors,
        greyMid: greyMid ?? this.greyMid,
        expressoChocolate: expressoChocolate ?? this.expressoChocolate,
        almostBlack: almostBlack ?? this.almostBlack,
        lightWhiteChocolate: lightWhiteChocolate ?? this.lightWhiteChocolate,
        greenSuccess: greenSuccess ?? this.greenSuccess,
        almostWhite: almostWhite ?? this.almostWhite,
        lightestWhiteChocolate:
            lightestWhiteChocolate ?? this.lightestWhiteChocolate,
        greyLightest: greyLightest ?? this.greyLightest,
        espressoChocolate: espressoChocolate ?? this.espressoChocolate,
        black: black ?? this.black,
        bannerError: bannerError ?? this.bannerError,
        bannerSuccess: bannerSuccess ?? this.bannerSuccess,
        singpassColor: singpassColor ?? this.singpassColor,
        roseTint: roseTint ?? this.roseTint,
        systemBlue: systemBlue ?? this.systemBlue,
        darkGray1: darkGray1 ?? this.darkGray1,
        dropShadow: dropShadow ?? this.dropShadow,
        gradientRuby0: gradientRuby0 ?? this.gradientRuby0,
        gradientRuby1: gradientRuby1 ?? this.gradientRuby1);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      scaffoldBackgroundColor: Color.lerp(
              scaffoldBackgroundColor, other.scaffoldBackgroundColor, t) ??
          scaffoldBackgroundColor,
      darkChocolate:
          Color.lerp(darkChocolate, other.darkChocolate, t) ?? darkChocolate,
      paleChocolate:
          Color.lerp(paleChocolate, other.paleChocolate, t) ?? paleChocolate,
      lightTextColor:
          Color.lerp(lightTextColor, other.lightTextColor, t) ?? lightTextColor,
      whiteChocolate:
          Color.lerp(whiteChocolate, other.whiteChocolate, t) ?? whiteChocolate,
      greyLight: Color.lerp(greyLight, other.greyLight, t) ?? greyLight,
      rubyChocolate:
          Color.lerp(rubyChocolate, other.rubyChocolate, t) ?? rubyChocolate,
      white: Color.lerp(white, other.white, t) ?? white,
      milkChocolate:
          Color.lerp(milkChocolate, other.milkChocolate, t) ?? milkChocolate,
      darkGray: Color.lerp(darkGray, other.darkGray, t) ?? darkGray,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t) ?? shadowColor,
      shadowColorDarkBg:
          Color.lerp(shadowColorDarkBg, other.shadowColorDarkBg, t) ??
              shadowColorDarkBg,
      buttonShadowColor:
          Color.lerp(buttonShadowColor, other.buttonShadowColor, t) ??
              buttonShadowColor,
      slideButtonColor:
          Color.lerp(slideButtonColor, other.slideButtonColor, t) ??
              slideButtonColor,
      textLineColor:
          Color.lerp(textLineColor, other.textLineColor, t) ?? textLineColor,
      checkBoxOutlineColor:
          Color.lerp(checkBoxOutlineColor, other.checkBoxOutlineColor, t) ??
              checkBoxOutlineColor,
      redErrors: Color.lerp(redErrors, other.redErrors, t) ?? redErrors,
      greyMid: Color.lerp(greyMid, other.greyMid, t) ?? greyMid,
      expressoChocolate:
          Color.lerp(expressoChocolate, other.expressoChocolate, t) ??
              expressoChocolate,
      almostBlack: Color.lerp(almostBlack, other.almostBlack, t) ?? almostBlack,
      lightWhiteChocolate:
          Color.lerp(lightWhiteChocolate, other.lightWhiteChocolate, t) ??
              lightWhiteChocolate,
      greenSuccess:
          Color.lerp(greenSuccess, other.greenSuccess, t) ?? greenSuccess,
      almostWhite: Color.lerp(almostWhite, other.almostWhite, t) ?? almostWhite,
      lightestWhiteChocolate:
          Color.lerp(lightestWhiteChocolate, other.lightestWhiteChocolate, t) ??
              lightestWhiteChocolate,
      greyLightest:
          Color.lerp(greyLightest, other.greyLightest, t) ?? greyLightest,
      black: Color.lerp(black, other.black, t) ?? black,
      espressoChocolate:
          Color.lerp(espressoChocolate, other.espressoChocolate, t) ??
              espressoChocolate,
      bannerError: Color.lerp(bannerError, other.bannerError, t) ?? bannerError,
      bannerSuccess:
          Color.lerp(bannerSuccess, other.bannerSuccess, t) ?? bannerSuccess,
      singpassColor:
          Color.lerp(singpassColor, other.singpassColor, t) ?? singpassColor,
      roseTint: Color.lerp(roseTint, other.roseTint, t) ?? roseTint,
      systemBlue: Color.lerp(systemBlue, other.systemBlue, t) ?? systemBlue,
      darkGray1: Color.lerp(darkGray1, other.darkGray1, t) ?? darkGray1,
      dropShadow: Color.lerp(dropShadow, other.dropShadow, t) ?? dropShadow,
      gradientRuby0:
          Color.lerp(gradientRuby0, other.gradientRuby0, t) ?? gradientRuby0,
      gradientRuby1:
          Color.lerp(gradientRuby1, other.gradientRuby1, t) ?? gradientRuby1,
    );
  }
}
