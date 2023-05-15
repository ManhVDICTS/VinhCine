import 'package:flutter/material.dart';

import 'app_themes.dart';

ThemeData getThemeDefault() {
  return ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const AppColors(
        paleChocolate: Color(0xffF1E7DC),
        darkChocolate: Color(0xff3D1912),
        rubyChocolate: Color(0xffE42082),
        espressoChocolate: Color(0xff914507),
        milkChocolate: Color(0xff701D1B),
        whiteChocolate: Color(0xffBA894F),
        greenSuccess: Color(0xff009761),
        redErrors: Color(0xffCC1000),
        black: Color(0xff000000),
        white: Color(0xffFFFFFF),
        almostWhite: Color(0xffF8F8F8),
        darkGray: Color(0xff3E3E3E),
        greyLight: Color(0xff9F9FA5),
        greyMid: Color(0xff6E7177),
        greyLightest: Color(0xffD2D3D5),
        shadowColor: Color(0x14121212),
        shadowColorDarkBg: Color(0x3d121212),
        systemBlue: Color(0xff007AFF),
        dropShadow: Color(0x408A959E),

        // Not in Figma
        scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
        lightTextColor: Color.fromRGBO(255, 255, 255, 1),
        buttonShadowColor: Color.fromRGBO(111, 136, 157, 0.25),
        slideButtonColor: Color.fromRGBO(21, 25, 64, 1),
        textLineColor: Color.fromRGBO(127, 129, 146, 1),
        checkBoxOutlineColor: Color.fromRGBO(209, 209, 221, 1),
        expressoChocolate: Color.fromRGBO(145, 69, 7, 1),
        lightWhiteChocolate: Color.fromRGBO(186, 137, 79, 0.1),
        almostBlack: Color.fromRGBO(51, 51, 51, 1),
        lightestWhiteChocolate: Color.fromRGBO(186, 137, 79, 0.3),
        bannerSuccess: Color(0xFFD6F6EB),
        bannerError: Color(0xFFFFB3AC),
        singpassColor: Color(0xffF4333D),
        roseTint: Color(0x66701D1B),
        darkGray1: Color(0xff4E5258),
        gradientRuby0: Color(0xffE12482),
        gradientRuby1: Color(0xffFF52A8),
      ),
      const AppFonts(mainFont: 'Roboto', subFont: 'Inter')
    ],
  );
}
