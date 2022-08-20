import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {
  const MaterialFlutterApp({Key? key}) : super(key: key);

  @override
  State<MaterialFlutterApp> createState() => _MaterialFlutterAppState();
}

class _MaterialFlutterAppState extends State<MaterialFlutterApp> {
  @override
  Widget build(BuildContext context) {
    //return null; build 함수는 화면에 표시하는 함수인데 null이 들어가있으면 아무것도 표시할수 없으므로 오류가 생김
    return Scaffold();
  }
}
