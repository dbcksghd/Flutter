import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First page',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the Second page'),
          onPressed: (){ //버튼을 눌렀을때 SecondPage로 이동하기 위한 네비게이터 설정하기
            Navigator.push(context2, MaterialPageRoute(
              builder: (BuildContext context){
                return SecondPage();
              }
            ));
          }
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go to the First page'),
            onPressed: (){ //눌렀을때 Second가 사라지도록 pop해줌 (스택구조상 pop하면 밖으로 튀어나감)
              Navigator.pop(ctx);
            }
        ),
      ),
    );
  }
}
