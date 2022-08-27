import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //http 패키지 불러오기
import 'dart:convert';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List? data; //받은 데이터를 리스트 형태의 data 변수에 넣음
  TextEditingController? _editingController; //검색 기능 추가하기
  ScrollController? _scrollController;
  int page = 1;

  @override
  void initState() {//변수 초기화 initState
    super.initState();
    data = new List.empty(growable: true); // data에 크기가 늘어날 수 있는 빈 리스트를 넣음
    _editingController = new TextEditingController(); //검색 창 초기화
    _scrollController = new ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange) {
        print('bottom');
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          //앱바 위치에 검색박스 넣기
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어를 입력하세요'),
        ),
      ),
      body: Container(
        child: Center(
          child: data!.length == 0
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              data![index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width - 150,
                          //지금 화면의 넓이에서 이미지를 뺀 나머지만큼만 제목을 입력할수 있도록 해줌
                                  child: Text(
                                    data![index]['title'].toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                    '저자 : ${data![index]['authors'].toString()}'),
                                Text(
                                    '가격 : ${data![index]['sale_price'].toString()}'),
                                Text(
                                    '판매중 : ${data![index]['status'].toString()}'),
                              ],
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                    );
                  },
            itemCount: data!.length,
            controller: _scrollController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data!.clear();
          getJSONData(); //버튼을 눌렀을때 getJSONdata 함수 호출
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    //비동기로 데이터를 주고받기 위해 async 선언, Future는 비동기 처리에서 데이터를 바로 처리할 수 없을때 사용함
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController!.value.text}'; //카카오 api에 데이터를 요청하는 url를 넣음.
    // book? 까지는 요청할 도메인, title까지는 도메인에 요청할 파라미터, 마지막은 query 파라미터에 검색할것을 전달해줌
    // 한줄요약: dapi.kakao.com 서버에 있는 v3/search/book API에게 제목에 입력받은 이름이 포함된 책을 알려달라는 의미
    var response = await http.get(Uri.parse(url), //get 방식으로 URL에 접속하는 코드
        headers: {"Authorization": "KakaoAK 57a4b9d79c6fd6f1f26d9e801eef467a"});
    print(response.body); //검색 결과 로그창으로 확인
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body; //데이터를 받으면 HTML로 만들어진 본문(response.body)를 출력
  }
}
/*
네트워크 통신은 속도나 데이터양 같은 외부 요인때문에 정확한 데이터를 받아온 후 처리해야함
따라서 네트워크 프로그래밍을 할때는 비동기 방식을 사용하는게 좋다.

 */