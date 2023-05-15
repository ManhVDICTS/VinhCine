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
      ),
      const AppFonts(mainFont: 'Poppins', subFont: 'Inter')
    ],
  );
}
