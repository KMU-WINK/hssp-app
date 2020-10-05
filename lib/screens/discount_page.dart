import 'package:flutter/material.dart';
import 'package:hsspapp/models/px.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:provider/provider.dart';

class DiscountPage extends StatefulWidget {
  @override
  _DiscountPageState createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: Provider.of<GetDataProvider>(context, listen: false).getPX(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                  itemCount: snapshot.data.data.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "카드 혜택",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "NotoSans-Bold",
                        ),
                      ),
                    )
                        : _listItem(snapshot.data.data, index - 1);
                  },
                );
            }
          },
        ),
      ),
    );
  }

  _listItem(product, index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 120,
      width: double.infinity,
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
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(product[index].thumbnail),

                ),
                Flexible(
                  child: Text(
                    product[index].name,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'NotoSans-Bold',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
