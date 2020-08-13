import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hsspapp/Shared/image_constants.dart';
import 'package:hsspapp/models/swiper_model.dart';
import 'package:hsspapp/widgets/bottom_navigation.dart';
import 'package:hsspapp/widgets/menu_widget.dart';
import 'package:hsspapp/animation/fade_animation.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FadeAnimation(1.4, BottomNavigation()),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          //physics: ClampingScrollPhysics(),
          children: <Widget>[
            FadeAnimation(
              1,
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("Drawer Menu Tap!!");
                      },
                      child: SvgPicture.asset(
                        drawer,
                        height: 25.0,
                        width: 20.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(farmer),
                      radius: 25.0,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
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
                  FadeAnimation(
                    1.1,
                    Text(
                      "고생하셨습니다",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'NotoSans-Regular',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "허채림 병장(진)님",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontFamily: 'NotoSans-Bold',
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
