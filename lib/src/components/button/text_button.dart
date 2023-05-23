import 'package:flutter/material.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.padding,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius,
    this.border,
  });

  final String text;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 100)),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: Text(text, style: textStyle),
        ),
      ),
    );
  }
}

class TextTabButton extends StatelessWidget {
  const TextTabButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.selectedStatus});
  final String title;
  final VoidCallback onTap;
  final bool selectedStatus;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Text(title,
              style: selectedStatus
                  ? AppStyles.titleLargeBold(context)
                  : AppStyles.titleLargeRegular(context)
                      .copyWith(color: appColors?.gray)),
        ));
  }
}