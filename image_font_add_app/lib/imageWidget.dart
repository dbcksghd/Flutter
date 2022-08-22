import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  const ImageWidgetApp({Key? key}) : super(key: key);

  @override
  State<ImageWidgetApp> createState() => _ImageWidgetAppState();
}

class _ImageWidgetAppState extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('image/flutter_logo.png',
                width: 200,
                height: 100,
                fit: BoxFit.contain,
              ),
              Text('Hello Flutter',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30, color: Colors.blue
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
fit는 앱의 배경이나 이미지를 정해진 공간에 적절히 배치해야 할 때 사용할 수 있다.
fit에 설정할 수 있는 옵션값은 다음과 같다.

BoxFit.full : width, height를 가득 채워서 그린다.
BoxFit.contain : 이미지가 잘리지 않고 비율이 변하지 않는 범위에서 가능한 한 크게 그린다.
BoxFit.cover : 비율을 유지한 채 지정한 범위를 모두 덮도록 그린다. 대신 이미지가 잘릴 수 있다.
BoxFit.fitWidth : width를 꽉 채워서 그린다. 이미지가 잘릴 수 있다.
BoxFit.fitHeight : height를 꽉 채워서 그린다. 이미지가 잘릴 수 있다.
BoxFit.none : 원본 이미지를 표시한다. 이미지가 잘릴 수 있다.
BoxFit.scaleDown : 전체 이미지가 나올 수 있게 이미지 크기를 조절해서 표시한다.




















 */