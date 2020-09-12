import 'package:flutter/material.dart';
import 'package:hsspapp/models/food.dart';
import 'package:hsspapp/services/api_response.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:hsspapp/shared/image_constants.dart';
import 'package:hsspapp/shared/style_constants.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    Key key,
  }) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller =
        ScrollController(initialScrollOffset: 353.0 * 1);
    return Container(
      height: 205,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6, top: 10, bottom: 10),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            height: 205,
            width: 344,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
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
              child: FutureBuilder(
                future: Provider.of<GetDataProvider>(context, listen: false)
                    .getFood(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      final foods = snapshot.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                foods.data.meals[index].type == 'breakfast'
                                    ? '아침'
                                    : foods.data.meals[index].type == 'lunch'
                                        ? '점심'
                                        : '저녁',
                                style: TextStyle(
                                  color: Colors.greenAccent[700],
                                  letterSpacing: 3.0,
                                  fontFamily: 'NotoSans-Bold',
                                  fontSize: 25.0,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${foods.data.meals[index].menu[index].kcal.toString()} Kcal',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${foods.data.meals[index].menu[index].name}',
                            style: menuText,
                          ),
                          Text(
                            '단백질 : ${foods.data.meals[index].menu[index].protein}g',
                            style: menuText,
                          ),
                          Text(
                            '탄수화물 : ${foods.data.meals[index].menu[index].carbohydrate}g',
                            style: menuText,
                          ),
                        ],
                      );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
