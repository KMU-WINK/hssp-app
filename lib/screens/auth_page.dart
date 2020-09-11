import 'package:flutter/material.dart';
import 'package:hsspapp/animation/fade_animation.dart';
import 'package:hsspapp/components/custom_button.dart';
import 'package:hsspapp/components/custom_button_animation.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/screens/login_page.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _submitting = false;
  bool _checkingLoggedIn = true;

  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  _checkLoggedIn() async {
    try {
      final bool isLoggedIn = await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).tyrAutoLogin();

      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        setState(() => _checkingLoggedIn = false);
      }
    } catch (e) {
      print(e);
      setState(() => _checkingLoggedIn = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

//    if (_checkingLoggedIn) {
//      return Scaffold(
//        appBar: AppBar(
//          title: Text('WINK'),
//        ),
//        body: Center(
//          child: CircularProgressIndicator(),
//        ),
//      );
//    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            army,
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            margin: EdgeInsets.only(top: width * 0.25, bottom: width * 0.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1.0,
                      Text(
                        "평화를 만드는 강한 힘",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.055,
                            letterSpacing: 2,
                            fontFamily: 'NotoSans-Regular'),
                      ),
                    ),
                    FadeAnimation(
                      1.1,
                      Text(
                        "대한민국 국군",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.11,
                            fontFamily: 'NotoSans-Bold'),
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      1.2,
                      CustomButton(
                        width: width,
                        label: "회원가입",
                        background: Colors.transparent,
                        fontColor: Colors.white,
                        borderColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    FadeAnimation(
                      1.3,
                      CustomButtonAnimation(
                        width: width,
                        label: "로그인",
                        background: Colors.white,
                        fontColor: Colors.black,
                        borderColor: Colors.white,
                        child: LoginPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
//      body: Center(
//        child: _submitting
//            ? Center(
//                child: CircularProgressIndicator(),
//              )
//            : RaisedButton(
//                child: Text(
//                  'LOGIN',
//                  style: TextStyle(fontSize: 20.0),
//                ),
//                onPressed: () async {
//                  try {
//                    setState(() => _submitting = true);
//
//                    await Provider.of<AuthProvider>(
//                      context,
//                      listen: false,
//                    ).login();
//
//                    setState(() => _submitting = false);
//                    Navigator.pushReplacement(
//                      context,
//                      MaterialPageRoute(builder: (context) => MainPage()),
//                    );
//                  } catch (e) {
//                    print(e);
//                    setState(() => _submitting = false);
//                  }
//                },
//              ),
//      ),
    );
  }
}
