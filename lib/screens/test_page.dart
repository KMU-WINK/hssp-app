import 'package:flutter/material.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/providers/get_data.dart';
import 'package:hsspapp/screens/login_page.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await Provider.of<GetDataProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<GetDataProvider>(context).message;
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await Provider.of<AuthProvider>(
                context,
                listen: false,
              ).logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text('$message'),
      ),
    );
  }
}
