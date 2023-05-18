import 'package:flutter/material.dart';

import 'app_themes.dart';

ThemeData getThemeDefault() {
  return ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const AppColors(
        red: Color(0xFFdb1b2a),
        hintGray: Color(0xFFcbc0b8),
        gray: Color(0xFFcccdcd),
        backgroundDark: Color(0xFF081012),
        crimson: Color(0xFFdb1b2a),
        brown: Color(0xFFD9D5CB),
        white: Color(0xFFFFFFFF),
        dark: Color(0xFF081012),
        light:  Color(0xFFFFFFFF),
        darkBrown: Color(0xFF796451),
        darkGray: Color(0xFFBCBCBC),
      ),
      const AppFonts(mainFont: 'Poppins', subFont: 'Inter')
    ],
  );
}

ThemeData getDarkDefault() {
  return ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const AppColors(
        red: Color(0xFF00AFA5),
        hintGray: Color(0xFFcbc0b8),
        gray: Color(0xFFcccdcd),
        backgroundDark: Color(0xFF081012),
        crimson: Color(0xFF15172E),
        brown: Color(0xFF18213E),
        white: Color(0xFF081012),
        dark: Color(0xFFFFFFFF),
        light:  Color(0xFF1C2754),
        darkBrown: Color(0xFF5E6287),
        darkGray: Color(0xFF161F3D),
      ),
      const AppFonts(mainFont: 'Poppins', subFont: 'Inter')
    ],
  );
}
