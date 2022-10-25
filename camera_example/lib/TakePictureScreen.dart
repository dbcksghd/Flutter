import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

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
