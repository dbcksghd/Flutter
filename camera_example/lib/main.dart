import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UseCamera(),
    );
  }
}

class UseCamera extends StatefulWidget {
  const UseCamera({Key? key}) : super(key: key);

  @override
  State<UseCamera> createState() => _UseCameraState();
}

class _UseCameraState extends State<UseCamera> {
  File? image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage(ImageSource imageSource) async {
      final pickedFile = await picker.getImage(source: imageSource);
      setState(() {
        image = File(pickedFile!.path);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.camera);
              },
              child: Text('Camera'),
            ),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
            showImage(),
          ],
        ),
      ),
    );
  }
  Widget showImage() {
    if (image == null) {
      return Container();
    } else {
      return Image.file(image!);
    }
  }
}
