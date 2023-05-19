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