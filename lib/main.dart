import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hsspapp/providers/app_config.dart';
import 'package:hsspapp/providers/auth.dart';
import 'package:hsspapp/providers/get_data.dart';
import 'package:hsspapp/screens/auth_page.dart';
import 'package:hsspapp/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  const String wPort = '3010';
  final String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:$wPort' : 'http://localhost:$wPort';
  final String dataUrl = '$baseUrl/prod';

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
