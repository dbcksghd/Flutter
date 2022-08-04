import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var switchValue = false;
  Color _color = Colors.blue;
  String test = 'hello'; //test 변수에 hello 넣기
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text('$test'), //버튼에 test 변수에 있는 값 보이게 출력
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_color)),
                  onPressed: () {
                    //눌렀을때
                    if (_color == Colors.blue) {
                      //만약 _color가 파랑색이라면(초기상태)
                      setState(() {
                        // 고정
                        test = 'flutter'; //버튼에 flutter 표시
                        _color = Colors.amber; //색을 노랑색으로 바꿈
                      });
                    } else {
                      //아니면
                      setState(() {
                        //고정
                        test = 'flutter'; //버튼에 flutter 표시
                        _color = Colors.blue; //색을 파랑색으로 바꿈
                      });
                    }
                  })),
        ));
  }
}
