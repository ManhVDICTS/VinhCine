import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.cinemaRed,
    required this.hintGray,
    required this.gray,
    required this.backgroundDark,
  });
  final Color cinemaRed;
  final Color hintGray;
  final Color backgroundDark;
  final Color gray;

  @override
  AppColors copyWith(
      {Color? cinemaRed, Color? hintGray, Color? backgroundDark, Color? gray}) {
    return AppColors(
      cinemaRed: cinemaRed ?? this.cinemaRed,
      hintGray: hintGray ?? this.hintGray,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      gray: gray ?? this.gray,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      cinemaRed: Color.lerp(cinemaRed, other.cinemaRed, t) ?? cinemaRed,
      hintGray: Color.lerp(hintGray, other.hintGray, t) ?? hintGray,
      backgroundDark:
          Color.lerp(backgroundDark, other.backgroundDark, t) ?? backgroundDark,
      gray: Color.lerp(gray, other.gray, t) ?? gray,
    );
  }
}
