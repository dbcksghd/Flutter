import 'package:flutter/material.dart';
import 'package:splash_example/splash.dart';
import 'package:splash_example/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Example',
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
