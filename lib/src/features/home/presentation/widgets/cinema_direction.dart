import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CinemaDirection extends StatelessWidget {
  const CinemaDirection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          debugPrint('go to cinema location');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vinh Cine - Nghệ An',
              style: TextStyle(color: Color(0xFFcbc0b8), fontSize: 17),
            ),
            Row(
              children: [
                Text(
                  '500m',
                  style: TextStyle(color: Color(0xFFae2d34)),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.directions,
                  size: 32,
                  color: Color(0xFFae2d34),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
