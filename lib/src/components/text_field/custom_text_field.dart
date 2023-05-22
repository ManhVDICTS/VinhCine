import 'package:flutter/material.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  bool obscureText;
  Color? enabledBorderColor;
  Color? focusedBorderColor;
  Color? closeColor;

  CustomTextField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.hintText = "",
      this.hintStyle,
      this.obscureText = false,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.closeColor});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;
  bool _clearVisible = false;

  @override
  void initState() {
    _clearVisible = widget.controller?.text.isNotEmpty == true;
    _color = widget.enabledBorderColor;
    super.initState();
  }
  late Color? _color;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _color = !hasFocus ? widget.enabledBorderColor: widget.focusedBorderColor;
        });
      },
      child: TextFormField(
        onChanged: (String text) {
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
                      : Icons.remove_red_eye_outlined,
                  color: _color,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : _clearVisible
                  ? IconButton(
                      icon: Container(
                          width: 15,
                          height: 15,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: _color,
                            shape: BoxShape.circle,
                          ),
                          child: FittedBox(
                              child: Icon(Icons.close, color: widget.closeColor))),
                      onPressed: () {
                        setState(() {
                          _clearVisible = false;
                        });
                        widget.controller?.clear();
                      },
                    )
                  : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.focusedBorderColor ?? Colors.blue,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.enabledBorderColor ?? AppColorss.borderColor,
            ),
          ),
        ),
        obscureText: (widget.obscureText == true && !_passwordVisible),
      ),
    );
  }
}
