import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/loading_indicator/loading_indicator_widget.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/configs/app_themes/app_shadow.dart';

class _AppButton extends StatelessWidget {
  String? title;
  bool? isLoading;
  VoidCallback? onPressed;

  Color? textColor;
  Color? backgroundColor;

  _AppButton({this.title = '', this.isLoading = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: AppShadow.boxShadow,
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
        title ?? "",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      );
    }
  }
}

class AppWhiteButton extends _AppButton {
  AppWhiteButton({
    String title = '',
    bool isLoading = false,
    VoidCallback? onPressed,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    //SetupUI
    textColor = AppColors.main;
    backgroundColor = Colors.white;
  }
}

class AppTintButton extends _AppButton {
  AppTintButton({
    String title = '',
    bool isLoading = false,
    VoidCallback? onPressed,
  }) {
    this.title = title;
    this.isLoading = isLoading;
    this.onPressed = onPressed;
    //SetupUI
    textColor = Colors.white;
    backgroundColor = AppColors.main;
  }
}
