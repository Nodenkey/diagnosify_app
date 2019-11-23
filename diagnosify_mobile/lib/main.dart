import 'package:diagnosify2/pages/dashboard.dart';
import 'package:diagnosify2/pages/login.dart';
import 'package:diagnosify2/pages/onBoarding.dart';
import 'package:diagnosify2/pages/signUpChoice.dart';
import 'package:diagnosify2/pages/signup.dart';
import 'package:diagnosify2/pages/yet_to.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
//      debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Roboto',
            appBarTheme: AppBarTheme(elevation: 0, color: Colors.white)),
        home: OnBoarding(),
        routes: <String, WidgetBuilder>{
          '/choicePage': (BuildContext context) => Choice(),
          '/loginPage': (BuildContext context) => Login(),
          '/signupPage': (BuildContext context) => Signup(),
          '/dashboard': (BuildContext context) => Dashboard(),
          '/update': (BuildContext context) => Update(),
//          '/loader': (BuildContext context) => Loader(),
        });
  }
}
//TODO edit logo image asset in windows
