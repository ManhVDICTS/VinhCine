import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.red,
    required this.hintGray,
    required this.gray,
    required this.backgroundDark,
    required this.settingAppbar,
    required this.settingBackground,
    required this.settingTextColor,
    required this.settingItemBackground,
    required this.settingTitleBackground,
    required this.settingSeparateColor,
    required this.profileAppbar,
    required this.profileBackground,
    required this.profileTextColor,
    required this.profileItemBackground,
    required this.profileSeparateColor,
    required this.profileButtonColor,
    required this.profileTextButtonColor,
    required this.profileIconColor,
    required this.profileBarCodeBg,
    required this.profileBarCodeText,
    required this.signInBackground,
    required this.signInButtonColor,
    required this.signInTextButtonColor,
    required this.signInSeparateColor,
    required this.signInTextColor,
    required this.signInLinkColor,
    required this.signInFocusColor,
    required this.registerBackground,
    required this.registerButtonColor,
    required this.registerTextButtonColor,
    required this.registerSeparateColor,
    required this.registerTextColor,
    required this.registerLinkColor,
    required this.registerFocusColor,
    required this.forgotPasswordBackground,
    required this.forgotPasswordButtonColor,
    required this.forgotPasswordTextButtonColor,
    required this.forgotPasswordSeparateColor,
    required this.forgotPasswordTextColor,
    required this.forgotPasswordLinkColor,
    required this.forgotPasswordFocusColor,
    required this.forgotPasswordAppbar,
  });
  final Color red;
  final Color hintGray;
  final Color backgroundDark;
  final Color gray;
  final Color settingAppbar;
  final Color settingBackground;
  final Color settingTextColor;
  final Color settingItemBackground;
  final Color settingTitleBackground;
  final Color settingSeparateColor;
  final Color profileAppbar;
  final Color profileBackground;
  final Color profileTextColor;
  final Color profileItemBackground;
  final Color profileSeparateColor;
  final Color profileButtonColor;
  final Color profileIconColor;
  final Color profileTextButtonColor;
  final Color profileBarCodeBg;
  final Color profileBarCodeText;
  final Color signInBackground;
  final Color signInButtonColor;
  final Color signInTextButtonColor;
  final Color signInSeparateColor;
  final Color signInTextColor;
  final Color signInLinkColor;
  final Color signInFocusColor;
  final Color registerBackground;
  final Color registerButtonColor;
  final Color registerTextButtonColor;
  final Color registerSeparateColor;
  final Color registerTextColor;
  final Color registerLinkColor;
  final Color registerFocusColor;
  final Color forgotPasswordBackground;
  final Color forgotPasswordButtonColor;
  final Color forgotPasswordTextButtonColor;
  final Color forgotPasswordSeparateColor;
  final Color forgotPasswordTextColor;
  final Color forgotPasswordLinkColor;
  final Color forgotPasswordFocusColor;
  final Color forgotPasswordAppbar;

  @override
  AppColors copyWith({
    Color? red,
    Color? hintGray,
    Color? backgroundDark,
    Color? gray,
    Color? settingAppbar,
    Color? settingBackground,
    Color? settingTextColor,
    Color? settingItemBackground,
    Color? settingTitleBackground,
    Color? settingSeparateColor,
    Color? profileAppbar,
    Color? profileBackground,
    Color? profileTextColor,
    Color? profileItemBackground,
    Color? profileSeparateColor,
    Color? profileButtonColor,
    Color? profileIconColor,
    Color? profileTextButtonColor,
    Color? profileBarCodeBg,
    Color? profileBarCodeText,
    Color? signInBackground,
    Color? signInButtonColor,
    Color? signInTextButtonColor,
    Color? signInSeparateColor,
    Color? signInTextColor,
    Color? signInLinkColor,
    Color? signInFocusColor,
    Color? registerBackground,
    Color? registerButtonColor,
    Color? registerTextButtonColor,
    Color? registerSeparateColor,
    Color? registerTextColor,
    Color? registerLinkColor,
    Color? registerFocusColor,
    Color? forgotPasswordBackground,
    Color? forgotPasswordButtonColor,
    Color? forgotPasswordTextButtonColor,
    Color? forgotPasswordSeparateColor,
    Color? forgotPasswordTextColor,
    Color? forgotPasswordLinkColor,
    Color? forgotPasswordFocusColor,
    Color? forgotPasswordAppbar,
  }) {
    return AppColors(
      red: red ?? this.red,
      hintGray: hintGray ?? this.hintGray,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      gray: gray ?? this.gray,
      settingAppbar: settingAppbar ?? this.settingAppbar,
      settingBackground: settingBackground ?? this.settingBackground,
      settingTextColor: settingTextColor ?? this.settingTextColor,
      settingItemBackground: settingItemBackground ?? this.settingItemBackground,
      settingTitleBackground: settingTitleBackground ?? this.settingTitleBackground,
      settingSeparateColor: settingSeparateColor ?? this.settingSeparateColor,
      profileAppbar: profileAppbar ?? this.profileAppbar,
      profileBackground: profileBackground ?? this.profileBackground,
      profileTextColor: profileTextColor ?? this.profileTextColor,
      profileItemBackground: profileItemBackground ?? this.profileItemBackground,
      profileSeparateColor: profileSeparateColor ?? this.profileSeparateColor,
      profileButtonColor: profileButtonColor ?? this.profileButtonColor,
      profileIconColor: profileIconColor ?? this.profileIconColor,
      profileTextButtonColor: profileTextButtonColor ?? this.profileTextButtonColor,
      profileBarCodeBg: profileBarCodeBg ?? this.profileBarCodeBg,
      profileBarCodeText: profileBarCodeText ?? this.profileBarCodeText,
      signInBackground: signInBackground ?? this.signInBackground,
      signInButtonColor: signInButtonColor ?? this.signInButtonColor,
      signInTextButtonColor: signInTextButtonColor ?? this.signInTextButtonColor,
      signInSeparateColor: signInSeparateColor ?? this.signInSeparateColor,
      signInTextColor: signInTextColor ?? this.signInTextColor,
      signInLinkColor: signInLinkColor ?? this.signInLinkColor,
      signInFocusColor: signInFocusColor ?? this.signInFocusColor,
      registerBackground: registerBackground ?? this.registerBackground,
      registerButtonColor: registerButtonColor ?? this.registerButtonColor,
      registerTextButtonColor: registerTextButtonColor ?? this.registerTextButtonColor,
      registerSeparateColor: registerSeparateColor ?? this.registerSeparateColor,
      registerTextColor: registerTextColor ?? this.registerTextColor,
      registerLinkColor: registerLinkColor ?? this.registerLinkColor,
      registerFocusColor: registerFocusColor ?? this.registerFocusColor,
      forgotPasswordBackground: forgotPasswordBackground ?? this.forgotPasswordBackground,
      forgotPasswordButtonColor: forgotPasswordButtonColor ?? this.forgotPasswordButtonColor,
      forgotPasswordTextButtonColor: forgotPasswordTextButtonColor ?? this.forgotPasswordTextButtonColor,
      forgotPasswordSeparateColor: forgotPasswordSeparateColor ?? this.forgotPasswordSeparateColor,
      forgotPasswordTextColor: forgotPasswordTextColor ?? this.forgotPasswordTextColor,
      forgotPasswordLinkColor: forgotPasswordLinkColor ?? this.forgotPasswordLinkColor,
      forgotPasswordFocusColor: forgotPasswordFocusColor ?? this.forgotPasswordFocusColor,
      forgotPasswordAppbar: forgotPasswordAppbar ?? this.forgotPasswordAppbar,

    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      red: Color.lerp(red, other.red, t) ?? red,
      hintGray: Color.lerp(hintGray, other.hintGray, t) ?? hintGray,
      backgroundDark:
          Color.lerp(backgroundDark, other.backgroundDark, t) ?? backgroundDark,
      gray: Color.lerp(gray, other.gray, t) ?? gray,
      settingAppbar: Color.lerp(settingAppbar, other.settingAppbar, t) ?? settingAppbar,
      settingBackground: Color.lerp(settingBackground, other.settingBackground, t) ?? settingBackground,
      settingTextColor: Color.lerp(settingTextColor, other.settingTextColor, t) ?? settingTextColor,
      settingItemBackground: Color.lerp(settingItemBackground, other.settingItemBackground, t) ?? settingItemBackground,
      settingTitleBackground: Color.lerp(settingTitleBackground, other.settingTitleBackground, t) ?? settingTitleBackground,
      settingSeparateColor: Color.lerp(settingSeparateColor, other.settingSeparateColor, t) ?? settingSeparateColor,
      profileAppbar: Color.lerp(profileAppbar, other.profileAppbar, t) ?? profileAppbar,
      profileBackground: Color.lerp(profileBackground, other.profileBackground, t) ?? profileBackground,
      profileTextColor: Color.lerp(profileTextColor, other.profileTextColor, t) ?? profileTextColor,
      profileItemBackground: Color.lerp(profileItemBackground, other.profileItemBackground, t) ?? profileItemBackground,
      profileSeparateColor: Color.lerp(profileSeparateColor, other.profileSeparateColor, t) ?? profileSeparateColor,
      profileButtonColor: Color.lerp(profileButtonColor, other.profileButtonColor, t) ?? profileButtonColor,
      profileIconColor: Color.lerp(profileIconColor, other.profileIconColor, t) ?? profileIconColor,
      profileTextButtonColor: Color.lerp(profileTextButtonColor, other.profileTextButtonColor, t) ?? profileTextButtonColor,
      profileBarCodeBg: Color.lerp(profileBarCodeBg, other.profileBarCodeBg, t) ?? profileBarCodeBg,
      profileBarCodeText: Color.lerp(profileBarCodeText, other.profileBarCodeText, t) ?? profileBarCodeText,
      signInBackground: Color.lerp(signInBackground, other.signInBackground, t) ?? signInBackground,
      signInButtonColor: Color.lerp(signInButtonColor, other.signInButtonColor, t) ?? signInButtonColor,
      signInTextButtonColor: Color.lerp(signInTextButtonColor, other.signInTextButtonColor, t) ?? signInTextButtonColor,
      signInSeparateColor: Color.lerp(signInSeparateColor, other.signInSeparateColor, t) ?? signInSeparateColor,
      signInTextColor: Color.lerp(signInTextColor, other.signInTextColor, t) ?? signInTextColor,
      signInLinkColor: Color.lerp(signInLinkColor, other.signInLinkColor, t) ?? signInLinkColor,
      signInFocusColor: Color.lerp(signInFocusColor, other.signInFocusColor, t) ?? signInFocusColor,
      registerBackground: Color.lerp(registerBackground, other.registerBackground, t) ?? registerBackground,
      registerButtonColor: Color.lerp(registerButtonColor, other.registerButtonColor, t) ?? registerButtonColor,
      registerTextButtonColor: Color.lerp(registerTextButtonColor, other.registerTextButtonColor, t) ?? registerTextButtonColor,
      registerSeparateColor: Color.lerp(registerSeparateColor, other.registerSeparateColor, t) ?? registerSeparateColor,
      registerTextColor: Color.lerp(registerTextColor, other.registerTextColor, t) ?? registerTextColor,
      registerLinkColor: Color.lerp(registerLinkColor, other.registerLinkColor, t) ?? registerLinkColor,
      registerFocusColor: Color.lerp(registerFocusColor, other.registerFocusColor, t) ?? registerFocusColor,
      forgotPasswordBackground: Color.lerp(forgotPasswordBackground, other.forgotPasswordBackground, t) ?? forgotPasswordBackground,
      forgotPasswordButtonColor: Color.lerp(forgotPasswordButtonColor, other.forgotPasswordButtonColor, t) ?? forgotPasswordButtonColor,
      forgotPasswordTextButtonColor: Color.lerp(forgotPasswordTextButtonColor, other.forgotPasswordTextButtonColor, t) ?? forgotPasswordTextButtonColor,
      forgotPasswordSeparateColor: Color.lerp(forgotPasswordSeparateColor, other.forgotPasswordSeparateColor, t) ?? forgotPasswordSeparateColor,
      forgotPasswordTextColor: Color.lerp(forgotPasswordTextColor, other.forgotPasswordTextColor, t) ?? forgotPasswordTextColor,
      forgotPasswordLinkColor: Color.lerp(forgotPasswordLinkColor, other.forgotPasswordLinkColor, t) ?? forgotPasswordLinkColor,
      forgotPasswordFocusColor: Color.lerp(forgotPasswordFocusColor, other.forgotPasswordFocusColor, t) ?? forgotPasswordFocusColor,
      forgotPasswordAppbar: Color.lerp(forgotPasswordAppbar, other.forgotPasswordAppbar, t) ?? forgotPasswordAppbar,
    );
  }
}

//TODO will be deleted later
class AppColorss {
  ///Common
  static const Color main = Color(0xFF00C8A0);
  static const Color background = Color(0xFFFFFFFF);
  static const Color brown = Color(0xFFD9D5CB);
  static const Color darkBrown = Color(0xFF796451);

  ///Gradient
  static const Color gradientEnd = Color(0xFF00C8A0);
  static const Color gradientStart = Color(0xFF00AFA5);

  ///Shadow
  static const Color shadowColor = Color(0x25606060);

  ///Border
  static const Color borderColor = Color(0xFFBCBCBC);

  ///Text
  static const Color textTint = Color(0xFF00C8A0);
  static const Color textDart = Color(0xFF000000);
  static const Color textGray = Color(0xFF979ca8);

  ///Button
  static const Color buttonGreen = Color(0xFF00FF00);
  static const Color crimson = Color(0xFFAD2F34);
  static const Color blue = Color(0xFF4B90FD);

  ///Other
  static const Color lightGray = Color(0x1A606060);
  static const Color gray = Color(0xFF606060);
}