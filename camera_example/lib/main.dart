import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'TakePictureScreen.dart';


void main() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TakePictureScreen(),
    );
  }
}
