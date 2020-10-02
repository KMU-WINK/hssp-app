import 'package:flutter/material.dart';
import 'package:hsspapp/providers/app_config.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/services/get_data.dart';
import 'package:hsspapp/screens/auth_page.dart';
import 'package:provider/provider.dart';

void main() {
  final String baseUrl = 'https://hssp.kmuwink.com';
  final String dataUrl = '$baseUrl/api';

  final appConfig =
      AppConfig(baseUrl: baseUrl, dataUrl: dataUrl);

  runApp(MyApp(appConfig));
}

class MyApp extends StatelessWidget {
  final appConfiguration;

  MyApp(this.appConfiguration);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppConfig>.value(
          value: appConfiguration,
        ),
        ChangeNotifierProxyProvider<AppConfig, AuthProvider>(
          create: (_) => AuthProvider(),
          update: (_, appConfig, authNotifier) {
            authNotifier.appConfig = appConfig;
            return authNotifier;
          },
        ),
        ChangeNotifierProxyProvider2<AppConfig, AuthProvider, GetDataProvider>(
          create: (_) => GetDataProvider(),
          update: (_, appConfig, auth, getDataNotifier) {
            getDataNotifier.appConfig = appConfig;
            getDataNotifier.auth = auth;
            return getDataNotifier;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HSSP',
        home: AuthPage(),
        //home: MainPage(),
      ),
    );
  }
}

//import 'dart:io';
//
//void main()
//{
//  var firstShortDate = DateTime(2017, 1, 3); // 군복무 단축 법적 효력 발생 날짜
//  var enlistmentDate = DateTime(2018, 1, 30); // 2018-01-30 김태훈 입대일
//
//  print();
//  var shortenDate = 1 + (enlistmentDate.difference(firstShortDate).inDays) / 14; // 단축일 수 (1 + 입대일 - 군복무 단축 법적 효력 발생 날짜 / 14) 14 -> 2주
//
//  var originDischargeDate = enlistmentDate.add(new Duration(days: 600)); // 기존 전역일
//
////   var realDischargeDate = originDischargeDate - (shortenDate * 24 * 60 * 60);
//
////   print(realDischargeDate);
//}