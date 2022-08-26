import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //http 패키지 불러오기

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  State<HttpApp> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
          child: Text('$result'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async { //onPressed 함수를 비동기 방식으로 처리
          var url = 'http//www.naver.com';
          var response = await http.get(Uri.parse(url)); //get 방식으로 URL에 접속하는 코드
          //await을 통해 서버가 데이터를 넘겨줄때까지 대기
          setState(() {
            result = response.body; //데이터를 받으면 HTML로 만들어진 본문(response.body)를 출력
          });
        },
        /*네트워크 통신은 속도나 데이터양 같은 외부 요인때문에 정확한 데이터를 받아온 후 처리해야함
        따라서 네트워크 프로그래밍을 할때는 비동기 방식을 사용하는게 좋다.
         */
        child: Icon(Icons.file_download),
      ),
    );
  }
}
