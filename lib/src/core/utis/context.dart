import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  TextStyle get headline1 => textTheme.headlineLarge!;
}