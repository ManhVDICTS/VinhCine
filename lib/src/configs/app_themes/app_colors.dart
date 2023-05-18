import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.red,
    required this.hintGray,
    required this.gray,
    required this.backgroundDark,
    required this.crimson,
    required this.brown,
    required this.white,
    required this.dark,
    required this.light,
    required this.darkBrown,
    required this.darkGray,
  });
  final Color red;
  final Color hintGray;
  final Color backgroundDark;
  final Color gray;
  final Color crimson;
  final Color brown;
  final Color white;
  final Color dark;
  final Color light;
  final Color darkBrown;
  final Color darkGray;

  @override
  AppColors copyWith({
    Color? red,
    Color? hintGray,
    Color? backgroundDark,
    Color? gray,
    Color? crimson,
    Color? brown,
    Color? white,
    Color? dark,
    Color? light,
    Color? darkBrown,
    Color? darkGray,
  }) {
    return AppColors(
      red: red ?? this.red,
      hintGray: hintGray ?? this.hintGray,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      gray: gray ?? this.gray,
      crimson: crimson ?? this.crimson,
      brown: brown ?? this.brown,
      white: white ?? this.white,
      dark: dark ?? this.dark,
      light: light ?? this.light,
      darkBrown: darkBrown ?? this.darkBrown,
      darkGray: darkGray ?? this.darkGray,
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
      crimson: Color.lerp(crimson, other.crimson, t) ?? crimson,
      brown: Color.lerp(brown, other.brown, t) ?? brown,
      white: Color.lerp(white, other.white, t) ?? white,
      dark: Color.lerp(dark, other.dark, t) ?? dark,
      light: Color.lerp(light, other.light, t) ?? light,
      darkBrown: Color.lerp(darkBrown, other.darkBrown, t) ?? darkBrown,
      darkGray: Color.lerp(darkGray, other.darkGray, t) ?? darkGray,
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