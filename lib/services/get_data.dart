import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hsspapp/models/food.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/services/api_response.dart';
import 'package:http/http.dart' as http;


import '../providers/app_config.dart';

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

  Future<APIResponse<Food>> getFood(){
    return http.get('${appConfig.dataUrl}/food', headers: {'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjAxMDY1MzgxNzg4IiwiaWF0IjoxNTk5ODQ0NTEwLCJleHAiOjE2MDA0NDkzMTB9.Jn1XYXGhcBLWMaylkYPKeTckPk3DnJJ03BLrVj-Do3w'}).then((data){
      if(data.statusCode == 200){
        final jsonData = jsonDecode(utf8.decode(data.bodyBytes));
        print(jsonData);
        final Food food = Food.fromJson(jsonData);
        return APIResponse<Food>(data: food);
      }
      return APIResponse<Food>(error: true, errorMessage: "error");
    }).catchError((e) => APIResponse<Food>(error: true, errorMessage: e.toString()));
  }
}