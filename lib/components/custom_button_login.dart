import 'package:flutter/material.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:page_transition/page_transition.dart';

class ButtonLoginAnimation extends StatefulWidget {
  final double width;
  final String label;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const ButtonLoginAnimation(
      {Key key,
      this.width,
      this.label,
      this.borderColor,
      this.fontColor,
      this.onTap,
      this.child})
      : super(key: key);

  @override
  _ButtonLoginAnimationState createState() => _ButtonLoginAnimationState();
}

class _ButtonLoginAnimationState extends State<ButtonLoginAnimation>
    with TickerProviderStateMixin {
  AnimationController _positionController;
  Animation<double> _positionAnimation;

  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool _isLogin = false;
  bool _isIconHide = false;

  @override
  void initState() {
    super.initState();

    _positionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _positionAnimation =
        Tween<double>(begin: 10.0, end: 255.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: widget.child));
              });
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isLogin = true;
        });
        _positionController.forward();
      },
      child: Container(
          height: widget.width * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [mainColorEnd, mainColorStart],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.label,
                  style: TextStyle(
                    color: widget.fontColor,
                    fontSize: widget.width * 0.05,
                    fontFamily: 'NotoSans-Bold',
                  )),
            ],
          )),
    );
  }
}
