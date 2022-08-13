import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(primaryColor: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar'),
          centerTitle: true,
        ),
        body: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: FlatButton(
                child: Text(
                  'Show me',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  Scaffold.of(ctx).showSnackBar(SnackBar(
                    content: Text('ㅎㅇㅎㅇ'),
                  ));
                },
              ),
            );
          },
        ));
  }
}

/*위젯트리에서 Scaffold.of(context)는 context를 가지고 Scaffold 위젯을 찾게 된다.
하지만 context는 Scaffold보다 더 상위 위젯인 MyPage의 context이므로 MyPage 위로
올라가면서 Scaffold를 찾게 된다. 그래서 결국은 못찾는거임 ㅎㅎ

해결방법은 Scaffold보다 밑에 있는 위젯의 context를 사용하도록 만들면 됨!!
Bulider는 그동안 있던 context를 싹다 무시 하고 새로 만들어줘서 얘를 이용해
새로운 위젯을 만들어보자*/