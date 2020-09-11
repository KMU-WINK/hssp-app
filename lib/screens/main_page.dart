import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hsspapp/Shared/image_constants.dart';
import 'package:hsspapp/models/swiper_model.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:hsspapp/screens/auth_page.dart';
import 'package:hsspapp/widgets/bottom_navigation.dart';
import 'package:hsspapp/widgets/menu_widget.dart';
import 'package:hsspapp/animation/fade_animation.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentedIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
                      onTap: () async{
                        await Provider.of<AuthProvider>(context, listen: false,).logout();
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
            FadeAnimation(1.3, MenuWidget()),
            SizedBox(
              height: 25,
            ),
            FadeAnimation(
              1.4,
              Text(
                "콘텐츠가 들어갈 겁니다. 콘텐츠가 들어갈 겁니다. 콘텐츠가 들어갈",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            FadeAnimation(
              1.5,
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 190,
                      child: Swiper(
                        onIndexChanged: (index) {
                          setState(() {
                            _currentedIndex = index;
                          });
                        },
                        autoplay: true,
                        layout: SwiperLayout.DEFAULT,
                        itemCount: swiperEvent.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(
                                  swiperEvent[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: map<Widget>(swiperEvent, (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentedIndex == index
                                    ? Colors.blueAccent
                                    : Colors.grey[300],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~",
                    ),
                    Text(
                      "무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~",
                    ),
                    Text(
                      "무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~",
                    ),
                    Text(
                      "무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~무한 스크롤 뷰~~~~~~~~",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
