import 'package:flutter/material.dart';

class BackgroundShadow extends StatelessWidget {
  const BackgroundShadow({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.5, 0.7, 1],
            colors: [
              Color.fromRGBO(0, 0, 0, 0.6),
              Color.fromRGBO(0, 0, 0, 0.45),
              Color.fromRGBO(0, 0, 0, 0.3),
              Colors.transparent,
            ],
          ),
        ),
      );
  }
}
