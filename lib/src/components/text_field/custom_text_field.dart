import 'package:flutter/material.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  bool obscureText;

  CustomTextField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.hintText = "",
      this.hintStyle,
      this.obscureText = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;
  bool _clearVisible = false;

  @override
  void initState() {
    _clearVisible = widget.controller?.text.isNotEmpty == true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String text){
        setState(() {
          _clearVisible = widget.controller?.text.isNotEmpty == true;
        });
      },
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(_passwordVisible
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : _clearVisible ? IconButton(
                icon: Container(
                    width: 15,
                    height: 15,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const FittedBox(child: Icon(Icons.close, color: Colors.white))),
                onPressed: () {
                  setState(() {
                    _clearVisible = false;
                  });
                  widget.controller?.clear();
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
