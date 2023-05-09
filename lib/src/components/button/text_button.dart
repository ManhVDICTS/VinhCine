import 'package:flutter/material.dart';

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

class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      border: Border.all(color: Colors.white, width: 1.5),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      backgroundColor: Color(0xFFdb1b2a),
      textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      text: 'Đặt Vé',
      onTap: () {},
    );
  }
}
