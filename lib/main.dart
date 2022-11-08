import 'dart:io';

import 'package:flutter/material.dart';

import 'Screen/splash.dart';
import 'Utils/style.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: <String, WidgetBuilder>{
      //   '/profile': (BuildContext context) => DashBoard(currentTab: 0),
      //   // '/helloworld': (BuildContext context) => DynamicLinkScreen(),
      // },
      theme: ThemeData(
          primaryColor: blueColor,
          // colorScheme: ThemeData()
          //     .colorScheme
          //     .copyWith(secondary: redColor.withOpacity(0.0)),
          // accentColor: redColor,
          appBarTheme: const AppBarTheme(color: blueColor)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
