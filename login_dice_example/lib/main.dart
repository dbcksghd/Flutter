import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice game",
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log in'
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 50)
            ),
            Center(
              child: Image(image: AssetImage('image/zzal.gif'),
                width: 200,
                height: 200,
              ),
            ),
            Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.teal, //텍스트필드 밑쪽 색깔
                    inputDecorationTheme: InputDecorationTheme( //위에 조그만 글자
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0,
                      )
                    )
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: '아이디를 입력하세요'
                          ),
                          keyboardType: TextInputType.emailAddress, //입력 키보드
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: '비밀번호를 입력하세요'
                          ),
                          keyboardType: TextInputType.text, //입력 키보드
                          obscureText: true, //비밀번호 칠때 가려주는 기능 켜기
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.blueAccent,
                              child: Icon(Icons.arrow_forward,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              onPressed: () {

                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}