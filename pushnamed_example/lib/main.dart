import 'package:flutter/material.dart';
import 'package:pushnamed_example/ScreenA.dart';
import 'package:pushnamed_example/ScreenB.dart';
import 'package:pushnamed_example/ScreenC.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => ScreenA(),
        '/b' : (context) => ScreenB(),
        '/c' : (context) => ScreenC()
      },
    );
  }
}