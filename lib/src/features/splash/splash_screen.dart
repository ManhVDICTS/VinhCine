import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('hello'.tr());
  }
}
