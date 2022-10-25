import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
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
      home: TakePictureScreen(
      ),
    );
  }
}


class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePictureScreen(@required this.camera);

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  CameraController? controller;
  Future<void>? initializeControllerFuture;

  @override
  void initState(){
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.medium);
    initializeControllerFuture = controller!.initialize();
  }

  @override
  void dispose(){
    super.dispose();
    controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
