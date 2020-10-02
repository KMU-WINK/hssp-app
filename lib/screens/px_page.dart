import 'package:flutter/material.dart';
import 'package:hsspapp/models/px.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:provider/provider.dart';

class PxPage extends StatefulWidget {
  @override
  _PxPageState createState() => _PxPageState();
}

class _PxPageState extends State<PxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<PX>>(
          future: Provider.of<GetDataProvider>(context, listen: false).getPX(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                  );
                },
              );
            }
          },
        ),
      ),
//      body: Column(
//        children: <Widget>[
//          //CardView 식단
//          SizedBox(
//            height: 40,
//          ),
//
//          Padding(
//            padding: const EdgeInsets.only(left: 16, right: 16),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "이달의 인기 PX 상품",
//                  style: TextStyle(
//                    color: Colors.black,
//                    fontFamily: 'NotoSans-Bold',
//                    fontSize: 30.0,
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
    );
  }
}
