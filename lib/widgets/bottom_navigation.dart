import 'package:flutter/material.dart';
import 'package:hsspapp/screens/auth_page.dart';
import 'package:hsspapp/screens/login_page.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:hsspapp/shared/color_constants.dart';
import 'package:hsspapp/shared/image_constants.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      decoration: BoxDecoration(color: bottomColor, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 15,
          offset: Offset(0, 5),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  _selectedIndex == 0 ? Image.asset(selCalc, height: 20, width: 20,) : Image.asset(calc, height: 20, width: 20,),
              title: Text(""),
            ),

            BottomNavigationBarItem(
              icon:
              _selectedIndex == 1 ? Image.asset(selSale, height: 20, width: 20,) : Image.asset(sale, height: 20, width: 20,),
              title: Text(""),
            ),

            BottomNavigationBarItem(
              icon:
              _selectedIndex == 2 ? Image.asset(selFood, height: 20, width: 20,) : Image.asset(food, height: 20, width: 20,),
              title: Text(""),
            ),

            BottomNavigationBarItem(
              icon:
              _selectedIndex == 3 ? Image.asset(selSetting, height: 20, width: 20,) : Image.asset(setting, height: 20, width: 20,),
              title: Text(""),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 0,
        ),
      ),
    );
  }
}
