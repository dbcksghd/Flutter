import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TakePictureScreen(
        camera: firstCamera,
      ),
    ),
  );
}

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  TakePictureScreen({required this.camera});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController? controller;
  Future<void>? initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    initializeControllerFuture = controller!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await initializeControllerFuture;
            final path = join((await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await controller.takePicture(path);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(),
            ),
            );
          } catch (e){
            print(e);
          }
        },
      ),
    );
  }
}
