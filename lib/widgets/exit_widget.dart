import 'package:flutter/material.dart';
import 'package:hsspapp/models/food.dart';
import 'package:hsspapp/services/api_response.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:hsspapp/shared/style_constants.dart';
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
                  buildExitDate(),
                  buildExitDate(),
                  buildExitDate(),
                  Text("일", style: TextStyle(
                    fontFamily: 'NotoSans-Bold'
                  ),),
                ],
              ),

              SizedBox(height: 30,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildExitTime(),
                  buildExitTime(),
                  Text(
                    ':',
                    style: TextStyle(
                      fontSize: 50,
                      color: mainColorStart,
                    ),
                  ),

                  buildExitTime(),
                  buildExitTime(),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }




  Container buildExitDate() {
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
      child: Text('1',
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),),
    );
  }

  Container buildExitTime() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      height: 50,
      width: 40,
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
      child: Text('1',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
    );
  }
}
