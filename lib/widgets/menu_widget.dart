import 'package:flutter/material.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:hsspapp/shared/style_constants.dart';
import 'package:hsspapp/models/menu_model.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController(initialScrollOffset: 353.0 * 1);
    return Container(
      height: 205,

      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6, top: 10, bottom: 10),
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            height: 205,
            width: 344,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 5,
                    offset: Offset(1, 2),
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        menus[index].meal,
                        style: TextStyle(
                          color: Colors.greenAccent[700],
                          letterSpacing: 3.0,
                          fontFamily: 'NotoSans-Bold',
                          fontSize: 25.0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${menus[index].calorie} Kcal',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: 'NotoSans-Regular',
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    menus[index].rice,
                    style: menuText,
                  ),
                  Text(
                    menus[index].stew,
                    style: menuText,
                  ),
                  Text(
                    menus[index].mainSideDish,
                    style: menuText,
                  ),
                  Text(
                    menus[index].subSideDish,
                    style: menuText,
                  ),
                  Text(
                    menus[index].dessert,
                    style: menuText,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}