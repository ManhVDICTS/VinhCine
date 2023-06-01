import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/shadow/background_shadow.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';
import 'package:vinhcine/src/core/utis/context.dart';

import '../../core/constants/dimension.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.onPressedLeading,
      required this.title,
      this.hasShadow = true,
      this.leadingIcon =
          const Icon(Icons.arrow_back_outlined, size: 32, color: Colors.white),
      this.trailingIcon,
      this.onPressedTrailing,
      this.titleStyle});

  final Icon leadingIcon;
  final Function onPressedLeading;
  final Icon? trailingIcon;
  final Function? onPressedTrailing;
  final String title;
  final TextStyle? titleStyle;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
            visible: hasShadow,
            child: BackgroundShadow(
              height: context.screenWidth / 2.5,
            )),
        _appBar(context),
      ],
    );
  }

  Widget _appBar(BuildContext context) => SafeArea(
        child: SizedBox(
          height: Dimession.appBarHeight,
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
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: titleStyle ?? AppStyles.titleLargeRegular(context),
                ),
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
