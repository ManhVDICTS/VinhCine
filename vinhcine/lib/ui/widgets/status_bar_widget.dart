import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/commons/app_colors.dart';
import 'package:vinhcine/commons/screen_size.dart';

class StatusBarWidget extends StatelessWidget {
  final Color color;

  StatusBarWidget({this.color = AppColors.main});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.of(context).topPadding,
      color: color,
    );
  }
}
