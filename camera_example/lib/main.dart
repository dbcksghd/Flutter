import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // 사용 가능한 카메라 목록 받아오기
  final cameras = await availableCameras();
  // 카메라 목록에서 특정 카메라를 가져오기
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // 적절한 카메라를 TakePictureScreen 위젯으로 전달
        camera: firstCamera,
      ),
    ),
  );
}

// 카메라로 사진을 찍을 수 있는 화면
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({required this.camera,});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController? controller;
  Future<void>? initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // 카메라의 현재 출력물을 보여주기 위해 CameraController 생성
    controller = CameraController(
      // 특정 카메라 가져오기
      widget.camera,
      // 해상도를 지정
      ResolutionPreset.medium,
    );

    // controller를 초기화, 초기화 메소드는 Future를 반환
    initializeControllerFuture = controller!.initialize();
  }

  @override
  void dispose() {
    // 위젯의 생명주기 종료시 컨트롤러로 해제
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      // 카메라 프리뷰를 보여주기 전에 컨트롤러 초기화 기다려야 함.
      // 초기화가 완료될 때까지 FutureBuilder로 로딩화면 보여주기
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 데이터가 오면 프리뷰 보여주기
            return CameraPreview(controller!);
          } else {
            // 아니면 로딩화면
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            // 카메라 초기화가 완료됐는지 확인하기
            await initializeControllerFuture;
            // 이미지가 저장될 경로를 지정
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // 사진 촬영을 시도하고 저장되는 경로를 로그로 남기기
            await controller!.takePicture(path);
            // 사진을 촬영 후 새로운 화면으로 넘어가기
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            // 에러 발생 시 로그 남기기
            print(e);
          }
        },
      ),
    );
  }
}

// 찍은 사진을 보여주는 위젯
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // 사진은 기기에 파일로 저장됨.
      body: Image.file(File(imagePath)),
    );
  }
}
