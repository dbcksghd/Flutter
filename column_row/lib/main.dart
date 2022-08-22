import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea( //스크린 안으로 위젯들이 들어올수 있게끔 해주는 역할
        //child: Center( //가운데로 배치하는 역할
          child: Row( //Column은 세로로 정렬, row는 가로로 정렬
            //mainAxisAlignment: MainAxisAlignment.center, // 정 중앙으로 배치하는 역할
            //mainAxisSize: MainAxisSize.min, //컨테이너의 필수 공간만큼으로 세로축 공간이 줄어듬
            //verticalDirection: VerticalDirection.up, //컨테이너들을 밑에서부터 순서대로 쌓아올림. down으로 바꾸면 위에서부터 아래로 정렬
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly, //같은 간격을 두고 세 컨테이너들이 떨어짐.
            //mainAxisAlignment: MainAxisAlignment.spaceBetween, // 컨테이너들이 상 중 하 딱 맞게 떨어짐
            //crossAxisAlignment: CrossAxisAlignment.end, //컨테이너 가로정렬
            //crossAxisAlignment: CrossAxisAlignment.stretch, //가로방향으로 화면을 채움 ex) (width: match height: wrap) 느낌
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Text('Container 1'),
              ),
              /*SizedBox( //1번과 2번 컨테이너 사이에 공간을 만들어주는 박스 생성
                height: 30.0, // 높이 30만큼만 띄우기
                width: 30.0 // 너비 30만큼만 띄우기
              ),*/
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('Container 3'),
              ),
              /*Container(
                width: double.infinity, //갈 수 있는 최대한 끝쪽으로 이동시킴 여기서는 오른쪽
              )*/
            ],
          ),
        ),
      //),
    );
  }
}
