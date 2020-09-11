import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:http/http.dart' as http;


import 'app_config.dart';

class GetDataProvider with ChangeNotifier { //AppConfig, AuthProvider에 의존
  String _message;
  String get message => _message;

  AppConfig _appConfig;
  AppConfig get appConfig => _appConfig;

  set appConfig(AppConfig appConfigVal) {
    if (_appConfig != appConfigVal) {
      _appConfig = appConfigVal;
      notifyListeners();
    }
  }

  AuthProvider _auth;
  AuthProvider get auth => _auth;

  set auth(AuthProvider authVal) {
    if (_auth != authVal) {
      _auth = authVal;
      notifyListeners();
    }
  }

  Future<void> getData() async {
    try {
      final String url = '${appConfig.dataUrl}';

      final http.Response response = await http
          .get(url, headers: {'Authorization': 'Bearer ${auth.token}'});
      final responseData = json.decode(response.body);

      if (response.statusCode != 200 || !responseData['success']) {
        throw 'Fail get data';
      }
      print(responseData);

      _message = responseData['message'];

      notifyListeners();
    } catch (e) {
      print('error: $e');

      throw e;
    }
  }
}