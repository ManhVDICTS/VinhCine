import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/shadow/background_shadow.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';
import 'package:vinhcine/src/core/utis/context.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.onPressedLeading,
      required this.title,
      this.brightness = true,
      this.leadingIcon =
          const Icon(Icons.arrow_back_outlined, size: 32, color: Colors.white),
      this.trailingIcon,
      this.onPressedTrailing});

  final Icon leadingIcon;
  final Function onPressedLeading;
  final Icon? trailingIcon;
  final Function? onPressedTrailing;
  final String title;
  final bool brightness;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
            visible: brightness,
            child: BackgroundShadow(
              height: context.screenWidth / 2.5,
            )),
        _appBar(context),
      ],
    );
  }

  Widget _appBar(BuildContext context) => SafeArea(
        child: SizedBox(
          height: 48,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: const EdgeInsets.all(5),
                icon: leadingIcon,
                onPressed: () {
                  onPressedLeading();
                },
              ),
              Text(
                title,
                style: AppStyles.titleLargeRegular(context),
              ),
              const Spacer(),
              _trailingIcon(),
            ],
          ),
        ),
      );

  Widget _trailingIcon() {
    return (trailingIcon != null)
        ? IconButton(
            padding: const EdgeInsets.all(5),
            icon: trailingIcon!,
            onPressed: () {
              onPressedTrailing?.call();
            },
          )
        : const SizedBox.shrink();
  }
}
