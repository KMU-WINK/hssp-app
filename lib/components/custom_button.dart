import 'package:flutter/material.dart';
import 'package:hsspapp/screens/main_page.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String label;
  final Color background;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const CustomButton({
    Key key,
    this.width,
    this.label,
    this.background,
    this.borderColor,
    this.fontColor,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => child),
        );
      },
      child: Container(
        height: width * 0.2,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: 1)),
        child: Text(label,
            style: TextStyle(
                color: fontColor,
                fontSize: width * 0.055,
                fontFamily: 'NotoSans-Bold')),
      ),
    );
  }
}
