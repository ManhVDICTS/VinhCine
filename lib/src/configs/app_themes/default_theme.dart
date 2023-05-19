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
        /// Setting screen
        settingAppbar: Color(0xFFAD2F34),
        settingBackground: Color(0xFFD9D5CB),
        settingTextColor: Color(0xFF081012),
        settingItemBackground:  Color(0xFFFFFFFF),
        settingTitleBackground: Color(0xFF796451),
        settingSeparateColor: Color(0xFFBCBCBC),
        /// profile screen
        profileAppbar: Color(0xFFAD2F34),
        profileBackground: Color(0xFFD9D5CB),
        profileTextColor: Color(0xFF081012),
        profileItemBackground:  Color(0xFFFFFFFF),
        profileSeparateColor: Color(0xFFBCBCBC),
        profileButtonColor: Color(0xFFAD2F34),
        profileTextButtonColor: Color(0xFFFFFFFF),
        profileIconColor: Color(0xFFAD2F34),
        profileBarCodeBg: Color(0xFFD4D4D6),
        profileBarCodeText: Color(0xFF081012),
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
        /// Setting screen
        settingAppbar: Color(0xFF195777),
        settingBackground: Color(0xFF2A282D),
        settingTextColor: Color(0xFFD4D4D6),
        settingItemBackground:  Color(0xFF4C4C4F),
        settingTitleBackground: Color(0xFF9FABBA),
        settingSeparateColor: Color(0xFF282828),
        /// profile screen
        profileAppbar: Color(0xFF195777),
        profileBackground: Color(0xFF2A282D),
        profileTextColor: Color(0xFFD4D4D6),
        profileItemBackground:  Color(0xFF4C4C4F),
        profileSeparateColor: Color(0xFF282828),
        profileButtonColor: Color(0xFF195777),
        profileTextButtonColor: Color(0xFFD4D4D6),
        profileIconColor: Color(0xFF00AFA5),
        profileBarCodeBg: Color(0xFFD4D4D6),
        profileBarCodeText: Color(0xFF081012),
      ),
      const AppFonts(mainFont: 'Poppins', subFont: 'Inter')
    ],
  );
}
