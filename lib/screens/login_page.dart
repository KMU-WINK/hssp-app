import 'package:flutter/material.dart';
import 'package:hsspapp/components/custom_button_login.dart';
import 'package:hsspapp/components/custom_textfield.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:hsspapp/shared/image_constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(army2),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          )),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 40),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("환영합니다",
                          style: TextStyle(
                              color: Color(0xFFF032f42),
                              fontSize: 30,
                              fontFamily: 'NotoSans-Bold')),
                      Text("당신의 멋진 군생활을 응원합니다",
                          style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'NotoSans-Regular')),
                      SizedBox(height: 40),
                      CustomTextField(
                        label: "이메일",
                      ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: "비밀번호",
                      isPassword: true,
                      icon: Icon(
                        Icons.https,
                        size: 27,
                        color: Color(0xFFF032f41),
                      ),
                    ),
                    SizedBox(height: 40),
                    ButtonLoginAnimation(
                      label: "Login",
                      fontColor: Colors.white,
                      background: Color(0xFFF1f94aa),
                      borderColor: Color(0xFFF1a7a8c),
                      child: MainPage(),
                    )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
