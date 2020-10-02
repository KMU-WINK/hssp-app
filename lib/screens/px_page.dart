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
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final product = snapshot.data;
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      height: 150,
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
//                    return ListTile(
//                      leading: CircleAvatar(
//                        backgroundImage: NetworkImage(product[index].thumbnail),
//                      ),
//                      title: Text(product[index].name),
//                    );
                  },
                );
            }
//
//            print(snapshot.data);
//            if (snapshot.data == null) {
//              return Container(
//                child: Center(
//                  child: CircularProgressIndicator(),
//                ),
//              );
//            } else {
//              return ListView.builder(
//                itemCount: snapshot.data.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(
//                    leading: CircleAvatar(
//                      backgroundImage: NetworkImage(snapshot.data[index].thumbnail),
//                    ),
//                    title: Text(snapshot.data[index].name),
//                  );
//                },
//              );
//            }
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
