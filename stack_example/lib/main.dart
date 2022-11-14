import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 30,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            top: 80,
            left: 70,
            child: Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
