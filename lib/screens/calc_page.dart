import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/screens/auth_page.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:hsspapp/widgets/exit_widget.dart';
import 'package:hsspapp/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      await Provider.of<AuthProvider>(
                        context,
                        listen: false,
                      ).logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPage()),
                      );
                    },
                    child: SvgPicture.asset(
                      drawer,
                      height: 25.0,
                      width: 20.0,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(mainCharacter),
                    radius: 25.0,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),

            //CardView 식단
            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "고생하셨습니다",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'NotoSans-Regular',
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "허채림 병장(진)님",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'NotoSans-Bold',
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            buildTodayMeals(),
            MenuWidget(),
            SizedBox(
              height: 25,
            ),

            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "전역일 계산",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NotoSans-Bold',
                          fontSize: 30.0,
                        ),
                      ),
                      MaterialButton(
                        minWidth: 15,
                        height: 30,
                        onPressed: () {},
                        color: settingColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '휴가관리',
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white,
                            fontFamily: 'NotoSans-Bold',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExitWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTodayMeals() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "오늘의 식단",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'NotoSans-Bold',
              fontSize: 30.0,
            ),
          ),
          MaterialButton(
            minWidth: 15,
            height: 30,
            onPressed: () {},
            color: settingColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '식단관리',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.white,
                fontFamily: 'NotoSans-Bold',
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
