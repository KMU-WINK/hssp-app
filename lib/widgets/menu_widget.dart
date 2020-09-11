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
  APIResponse<Food> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    getFood();
    super.initState();
  }

  getFood() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse =
        await Provider.of<GetDataProvider>(context, listen: false).getFood();

    setState(() {
      _isLoading = false;
    });
  }

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
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              _apiResponse.data.meals[index].type == 'breakfast'
                                  ? '아침'
                                  : _apiResponse.data.meals[index].type ==
                                          'lunch'
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
                              '${_apiResponse.data.meals[index].menu[index].kcal.toString()} Kcal',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: 'NotoSans-Regular',
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${_apiResponse.data.meals[index].menu[index].name}',
                          style: menuText,
                        ),
                        Text(
                          '단백질 : ${_apiResponse.data.meals[index].menu[index].protein}',
                          style: menuText,
                        ),
                        Text(
                          '탄수화물 : ${_apiResponse.data.meals[index].menu[index].carbohydrate}',
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
