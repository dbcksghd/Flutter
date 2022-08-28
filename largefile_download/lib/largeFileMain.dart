import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io'; //파일 입출력을 도와줄 패키지

class LargeFileMain extends StatefulWidget {
  const LargeFileMain({Key? key}) : super(key: key);

  @override
  State<LargeFileMain> createState() => _LargeFileMainState();
}

class _LargeFileMainState extends State<LargeFileMain> {
  //다운로드 할 이미지 주소
  final imgUrl = 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMTdfMTM3%2FMDAxNjM3MTMwMzk1MTU2.CQt8WsFrmJMqPL5Hp3cAdwQ96TXs7Nd03YBtoUNFdcog.nZnp2kIG0zGx2BxuCayNfVRyviarz8rmpqKO6OWE_c8g.JPEG.mt_nf%2FKakaoTalk_Photo_2021-11-17-15-26-17.jpeg&type=sc960_832';
  bool downloading = false; //다운로딩 중인지 확인하는 변수
  var progressString = ""; //지금 얼마나 다운로드되었는지 표시해주는 변수
  String file = ""; //다운로드할 파일

  Future<void> downloadFile() async {
    Dio dio = Dio();
    try{
      var dir = await getApplicationDocumentsDirectory(); //플러터 앱의 내부 디렉토리를 가져오는 역할
      await dio.download(imgUrl, '${dir.path}/myimage.jpg', //url에 담긴 주소를 가져옴, 받은 파일은 내부 디렉토리 안에 myimage.jpg라는 이름으로 저장
          onReceiveProgress: (rec, total){ //데이터를 받을때마다 실행하는 함수
            print('Res: $rec, Total: $total'); //rec는 지금까지 받은 데이터, total은 파일의 전체 크기
            file = '${dir.path}/myImage.jpg';
            setState(() {
              downloading = true; //다운로딩이 시작되면 true
              progressString = ((rec/total) * 100).toStringAsFixed(0) + '%'; //퍼센트게이지로 보여주기 위해 rec/total 후 100을 곱함
            });
          });
    } catch (e){
      print(e);
    }
    setState(() {
      downloading = false; //다 받았으면 false
      progressString = 'Completed'; //성공했다고 출력
    });
    print('Download completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Large File Example'),
      ),
      body: Center(
          child: downloading
              ? Container(
            height: 120.0,
            width: 200.0,
            child: Card(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Downloading File: $progressString',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
              : FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none: //오류가 발생했을 때
                  print('none');
                  return Text('데이터 없음');
                case ConnectionState.waiting: //데이터가 연결되기 전
                  print('waiting');
                  return CircularProgressIndicator();
                case ConnectionState.active: //하나 이상의 데이터를 반환했을 때
                  print('active');
                  return CircularProgressIndicator();
                case ConnectionState.done: //데이터를 다 받았을때
                  print('done');
                  if (snapshot.hasData) {
                    return snapshot.data as Widget;
                  }
              }
              return Text('데이터 없음');
            },
            future: downloadWidget(file),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
  Future<Widget> downloadWidget(String filePath) async {
    File file = File(filePath);
    bool exist = await file.exists();
    new FileImage(file).evict(); //캐시 초기화하기

    if (exist) {
      return Center(
        child: Column(
          children: [
            Image.file(File(filePath))
          ],
        ),
      );
    } else {
      return Text('No Data');
    }
  }
}
