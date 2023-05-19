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
        crimson: Color(0xFF195777),
        brown: Color(0xFF2A282D),
        white: Color(0xFF081012),
        dark: Color(0xFFD4D4D6),
        light:  Color(0xFF4C4C4F),
        darkBrown: Color(0xFF9FABBA),
        darkGray: Color(0xFF282828),
      ),
      const AppFonts(mainFont: 'Poppins', subFont: 'Inter')
    ],
  );
}
