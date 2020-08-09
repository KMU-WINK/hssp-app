import 'package:flutter/material.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _submitting = false;
  bool _checkingLoggedIn = true;

  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  _checkLoggedIn() async {
    try {
      final bool isLoggedIn = await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).tyrAutoLogin();

      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        setState(() => _checkingLoggedIn = false);
      }
    } catch (e) {
      print(e);
      setState(() => _checkingLoggedIn = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingLoggedIn) {
      return Scaffold(
        appBar: AppBar(
          title: Text('WINK'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('WINK'),
      ),
      body: Center(
        child: _submitting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RaisedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  try {
                    setState(() => _submitting = true);

                    await Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    ).login();

                    setState(() => _submitting = false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  } catch (e) {
                    print(e);
                    setState(() => _submitting = false);
                  }
                },
              ),
      ),
    );
  }
}
