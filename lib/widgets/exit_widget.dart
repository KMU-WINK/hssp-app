import 'package:flutter/material.dart';
import 'package:hsspapp/models/food.dart';
import 'package:hsspapp/services/api_response.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:hsspapp/shared/style_constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class ExitWidget extends StatefulWidget {
  const ExitWidget({
    Key key,
  }) : super(key: key);

  @override
  _ExitWidgetState createState() => _ExitWidgetState();
}

class _ExitWidgetState extends State<ExitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        height: 205,
        width: 344,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 5,
                offset: Offset(1, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildExitDate(date: 4),
                  buildExitDate(date: 5),
                  buildExitDate(date: 3),
                  Text(
                    "일",
                    style: TextStyle(fontFamily: 'NotoSans-Bold'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  buildExitTime(padding: 8, date: 1),
                  buildExitTime(padding: 0, date: 7),
                  Text(
                    ':',
                    style: TextStyle(
                      fontSize: 50,
                      color: mainColorStart,
                    ),
                  ),
                  buildExitTime(padding: 8, date: 5),
                  buildExitTime(padding: 0, date: 5),
                  buildExitSecond(),
                ],
              ),
              Center(
                child: Text(
                  '(식사집합 1547회)',
                  style: TextStyle(
                      fontFamily: 'NotoSans-Regular',
                      fontSize: 20,
                      letterSpacing: 3.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: LinearPercentIndicator(
                  width: 280,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.33,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: mainColorEnd,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '33.8%',
                  style: TextStyle(
                      fontFamily: 'NotoSans-Medium',
                      fontSize: 15,
                      letterSpacing: 3.0),
                ),
              ),

              Text(
                "남은 출타",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NotoSans-Bold',
                  fontSize: 25.0,
                  letterSpacing: 3.0,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Container buildExitDate({int date}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      height: 80,
      width: 60,
      decoration: BoxDecoration(
          color: exitTimeButton,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.5,
              blurRadius: 5,
              offset: Offset(1, 2),
            )
          ]),
      child: Text(
        date.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Container buildExitTime({double padding, int date}) {
    return Container(
      margin: EdgeInsets.only(right: padding),
      height: 40,
      width: 30,
      decoration: BoxDecoration(
          color: exitTimeButton,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.5,
              blurRadius: 5,
              offset: Offset(1, 2),
            )
          ]),
      child: Text(
        date.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Container buildExitSecond() {
    return Container(
      margin: EdgeInsets.only(left: 8),
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: exitTimeButton,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.5,
              blurRadius: 5,
              offset: Offset(1, 2),
            )
          ]),
      child: Center(
        child: Text(
          '58.55356s',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
