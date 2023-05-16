import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/loading_indicator/loading_indicator_widget.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/configs/app_themes/app_shadow.dart';

class _AppButton extends StatelessWidget {
  String title;
  bool? isLoading;
  VoidCallback? onPressed;
  FontStyle? fontStyle;
  FontWeight? fontWeight;
  Color? textColor;
  Color? backgroundColor;
  BoxBorder? border;
  double fontSize;

  _AppButton({
    super.key,
    this.title = '',
    this.isLoading = false,
    this.onPressed,
    this.border,
    this.fontStyle,
    this.textColor,
    this.backgroundColor,
    this.fontWeight,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        // boxShadow: AppShadow.boxShadow,
      ),
      child: ButtonTheme(
        minWidth: 0.0,
        height: 0.0,
        padding: const EdgeInsets.all(0),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
          ),
          onPressed: onPressed,
          child: _buildBodyWidget(),
        ),
      ),
    );
  }

  Widget _buildBodyWidget() {
    if (isLoading ?? true) {
      return const LoadingIndicatorWidget(color: Colors.white);
    } else {
      return Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: textColor,
        ),
      );
    }
  }
}

class AppWhiteButton extends _AppButton {
  AppWhiteButton({
    super.key,
    super.title = '',
    super.isLoading = false,
    super.onPressed,
    super.fontStyle,
    super.fontWeight,
    super.fontSize,
  }) : super(
          textColor: AppColorss.blue,
          backgroundColor: Colors.white,
        );
}

class AppTintButton extends _AppButton {
  AppTintButton({
    super.key,
    super.title = '',
    super.isLoading = false,
    super.onPressed,
    super.fontStyle,
    super.fontWeight,
    super.fontSize,
  }) : super(
          textColor: Colors.white,
          backgroundColor: AppColorss.main,
        );
}

class AppCrimsonButton extends _AppButton {
  AppCrimsonButton({
    super.key,
    super.title = '',
    super.isLoading = false,
    super.onPressed,
    super.fontStyle,
    super.fontWeight,
    super.fontSize,
  }) : super(
          textColor: Colors.white,
          backgroundColor: AppColorss.crimson,
        );
}

class AppBorderButton extends _AppButton {
  AppBorderButton({
    super.key,
    super.title = '',
    super.isLoading = false,
    super.onPressed,
    super.fontStyle,
    super.fontWeight,
    super.fontSize,
  }) : super(
          textColor: Colors.black,
          backgroundColor: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
        );
}
