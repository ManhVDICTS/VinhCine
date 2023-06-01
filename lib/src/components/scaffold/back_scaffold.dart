import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/icon_button.dart';

import '../../core/constants/dimension.dart';
import 'my_scaffold.dart';

class BackScaffold extends MyScaffold {
  const BackScaffold(
      {super.key,
      required this.title,
      required this.onBackTap,
      required super.child});

  final String title;
  final VoidCallback onBackTap;

  @override
  Widget? get leading {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 32),
          onTap: onBackTap,
          width: Dimession.appBarHeight,
          height: Dimession.appBarHeight,
        ),
        Text(title)
      ],
    );
  }
}
