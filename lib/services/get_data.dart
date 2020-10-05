import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:hsspapp/models/food.dart';
import 'package:hsspapp/models/px.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/services/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../providers/app_config.dart';

class GetDataProvider with ChangeNotifier { //AppConfig, AuthProvider에 의존
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjAxMDEyMzQ1Njc4IiwiaWF0IjoxNjAxNjE5ODU2LCJleHAiOjE2MDIyMjQ2NTZ9.1ayaCC62z6D-tPBqhqwnWJkwsescxWGctD1UbjBrfSU";

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
    return http.get('${appConfig.dataUrl}/food', headers: {'Authorization': token}).then((data){
      if(data.statusCode == 200){
        final jsonData = jsonDecode(utf8.decode(data.bodyBytes));
        final Food food = Food.fromJson(jsonData);
        return APIResponse<Food>(data: food);
      }
      return APIResponse<Food>(error: true, errorMessage: "error");
    }).catchError((e) => APIResponse<Food>(error: true, errorMessage: e.toString()));
  }

  Future<APIResponse<List<PX>>> getPX(){
    return http.get('${appConfig.dataUrl}/px', headers: {'Authorization': token}).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body).cast<Map<String, dynamic>>();
        return APIResponse<List<PX>>(data: jsonData.map<PX>((json) => PX.fromJson(json)).toList());
      }
      return APIResponse<List<PX>>(error: true, errorMessage: "error");
    }).catchError((e) => APIResponse<Food>(error: true, errorMessage: e.toString()));
  }
}