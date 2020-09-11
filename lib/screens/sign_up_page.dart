import 'package:flutter/material.dart';
import 'package:hsspapp/animation/fade_animation.dart';
import 'package:hsspapp/components/circle_image.dart';
import 'package:hsspapp/components/custom_button_login.dart';
import 'package:hsspapp/components/custom_textfield.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _mailCon = TextEditingController();
  TextEditingController _nickCon = TextEditingController();
  TextEditingController _pwCon = TextEditingController();
  TextEditingController _cpwCon = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void dispose() {
    _mailCon.dispose();
    _nickCon.dispose();
    _pwCon.dispose();
    _cpwCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "생활관 막내",
          style: TextStyle(
            color: mainColorStart,
            letterSpacing: 5.0,
            fontSize: 25,
            fontFamily: 'NotoSans-Bold',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColorStart,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleImage(
              mainCharacter,
              radius: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "전입신고",
                      style: TextStyle(
                        fontFamily: 'NotoSans-Bold',
                        fontSize: 32.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "고생하셨습니다! 생활관 막내입니다!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'NotoSans-Regular',
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.2,
                      makeInput(label: '전화번호', editingController: _mailCon)),
                  FadeAnimation(1.3,
                      makeInput(label: '이름', editingController: _nickCon)),
                  FadeAnimation(
                      1.4,
                      makeInput(
                          label: '비밀번호',
                          obscureText: true,
                          editingController: _pwCon)),
                  FadeAnimation(
                      1.5,
                      makeInput(
                          label: '비밀번호 확인',
                          obscureText: true,
                          editingController: _cpwCon)),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1.6,
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          height: width * 0.15,
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
                              Text('가입하기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.05,
                                    fontFamily: 'NotoSans-Bold',
                                  )),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                1.7,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "계정이 있으신가요? ",
                      style: TextStyle(fontFamily: 'Notosans-Regular'),
                    ),
                    InkWell(
                      onTap: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "로그인하기",
                        style: TextStyle(
                          fontFamily: 'Notosans-Bold',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput(
      {label, obscureText = false, TextEditingController editingController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'NotoSans-Regular',
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 1,
          controller: editingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: label == '전화번호'
                ? '전화번호를 입력해주세요'
                : label == '이름' ? '이름을 입력해주세요' : '비밀번호를 입력해주세요',
            hintStyle: TextStyle(
              fontFamily: 'NotoSans-Regular',
              fontSize: 13,
            ),
            prefixIcon: label == '전화번호'
                ? Icon(Icons.phone_iphone)
                : label == '이름' ? Icon(Icons.account_circle) : Icon(Icons.lock),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
