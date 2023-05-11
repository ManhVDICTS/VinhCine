import 'package:flutter/material.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';

class AppTextField extends StatefulWidget{
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  bool obscureText;

  AppTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText = "",
    this.hintStyle,
    this.obscureText = false
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        suffixIcon: widget.obscureText ? IconButton(
          icon: Icon(_passwordVisible ? Icons.remove_red_eye: Icons.remove_red_eye_outlined),
          onPressed: (){
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ) : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.borderColor,
          ),
        ),
      ),
      obscureText: (widget.obscureText == true && !_passwordVisible),
    );
  }
}