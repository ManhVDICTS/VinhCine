import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/shadow/background_shadow.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.onPressed,
      required this.title,
      this.brightness = true});

  Function onPressed;
  String title;
  bool brightness;

  late BuildContext _currentContext;

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return Stack(
      children: [
        Visibility(
            visible: brightness,
            child: BackgroundShadow(
              height: MediaQuery.of(_currentContext).size.width / 2.5,
            )),
        _appBar(),
      ],
    );
  }

  Widget _appBar() => SafeArea(
        child: SizedBox(
          height: 48,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(5),
                icon: const Icon(Icons.arrow_back_outlined,
                    size: 25, color: Colors.white),
                onPressed: () {
                  onPressed();
                },
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      );
}
