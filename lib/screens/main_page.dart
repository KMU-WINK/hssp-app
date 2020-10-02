import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/screens/auth_page.dart';
import 'package:hsspapp/screens/calc_page.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:hsspapp/widgets/exit_widget.dart';
import 'package:hsspapp/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    CalcPage(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: bottomColor, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5),
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0 ? Image.asset(selCalc, height: 20, width: 20,) : Image.asset(calc, height: 20, width: 20,),
              title: Text(""),
            ),

            BottomNavigationBarItem(
              icon: _selectedIndex == 1 ? Image.asset(selSale, height: 20, width: 20,) : Image.asset(sale, height: 20, width: 20,),
              title: Text(""),
            ),

            BottomNavigationBarItem(
              icon: _selectedIndex == 2 ? Image.asset(selFood, height: 20, width: 20,) : Image.asset(food, height: 20, width: 20,),
              title: Text(""),
            ),

            BottomNavigationBarItem(
              icon: _selectedIndex == 3 ? Image.asset(selSetting, height: 20, width: 20,) : Image.asset(setting, height: 20, width: 20,),
              title: Text(""),
            ),
          ],
            showSelectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            elevation: 0,),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
