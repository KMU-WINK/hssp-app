import 'package:flutter/material.dart';
import 'package:hsspapp/animation/fade_animation.dart';
import 'package:hsspapp/components/circle_image.dart';
import 'package:hsspapp/components/custom_button_login.dart';
import 'package:hsspapp/components/custom_textfield.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _mailCon = TextEditingController();
  TextEditingController _pwCon = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _mailCon.dispose();
    _pwCon.dispose();
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
          height: height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
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
                              fontSize: width * 0.08,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        FadeAnimation(
                          1.1,
                          Text(
                            "전화번호와 비밀번호를 입력해주세요",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'NotoSans-Regular',
                              fontSize: width * 0.035,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                            1.2,
                            makeInput(
                                label: '전화번호', editingController: _mailCon),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1.3, Text(
                              "고속상황전파체계는 아이디 대신 전화번호로 로그인해요!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'NotoSans-Regular',
                                fontSize: width * 0.028,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                              1.4,
                              makeInput(
                                  label: '비밀번호',
                                  obscureText: true,
                                  editingController: _pwCon)),
                          SizedBox(
                            height: 6,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPage()));
                              },
                              child: FadeAnimation(
                                1.5,
                                Text(
                                  "비밀번호 찾기",
                                  style:
                                      TextStyle(fontFamily: 'NotoSans-Medium'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: FadeAnimation(
                        1.6,
                        ButtonLoginAnimation(
                          width: width,
                          label: "로그인",
                          fontColor: Colors.white,
                          borderColor: Color(0xFFF1a7a8c),
                          child: MainPage(),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.7,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "계정이 없으신가요? ",
                            style: TextStyle(fontFamily: 'Notosans-Regular'),
                          ),
                          InkWell(
                            onTap: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                            child: Text(
                              "가입하기",
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
              FadeAnimation(
                1.8,
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mainCharacter),
                    ),
                  ),
                ),
              )
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
        TextField(
          controller: editingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: obscureText ? '비밀번호를 입력해주세요' : '전화번호를 입력해주세요',
            hintStyle: TextStyle(
              fontFamily: 'NotoSans-Regular',
              fontSize: 13,
            ),
            prefixIcon:
                obscureText ? Icon(Icons.lock) : Icon(Icons.phone_iphone),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }
}
