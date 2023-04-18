import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/commons/app_colors.dart';

class NotificationTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationTabPageState();
  }
}

class _NotificationTabPageState extends State<NotificationTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Center(
        child: Text('Notification Tab Page'),
      ),
    );
  }
}
