import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage(
    this.img, {
    this.radius = 10,
  });

  final double radius;
  final String img;

  @override
  Widget build(BuildContext context) {
    // wrapped around a column so that the avatar doesn't stretch
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          backgroundImage: AssetImage(
            img,
          ),
        )
      ],
    );
  }
}
