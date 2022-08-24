import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoFlutterApp(),
    );
  }
}

class CupertinoFlutterApp extends StatefulWidget {
  const CupertinoFlutterApp({Key? key}) : super(key: key);

  @override
  State<CupertinoFlutterApp> createState() => _CupertinoFlutterAppState();
}

class _CupertinoFlutterAppState extends State<CupertinoFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            CupertinoButton( //버튼 위젯
                child: Text('아이폰 느낌 버튼'),
                color: Colors.blue, //색깔
                onPressed: (){ //눌렀을때
                  showCupertinoDialog(
                      context: context,
                      builder: (context){
                        return CupertinoAlertDialog( //알림창 위젯
                          title: Text('Cupertino'),
                          content: Text('Cupertino 스타일의 위젯입니다'),
                          actions: [
                            CupertinoButton(
                                child: Text('확인'),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }),
                          ],
                        );
                      });
                }),
            SizedBox(
              width: 80,
              height: 80,
            ),
            SizedBox(
              child: Center(
                child: CupertinoActivityIndicator( //로딩 표시기 위젯
                  radius: 20, //크기는 20정도
                ),
              ),
            ),
            showCupertinoModalPopup(
                context: context, builder: (context){
            return CupertinoActionSheet(
              title: Text('Action'),
              message: Text('좋아하는 색은'),
              actions: <Widget>[
                CupertinoButton(
                    child: Text('빨강'),
                    onPressed: (){}),
                CupertinoButton(
                    child: Text('파랑'),
                    onPressed: (){}),
              ],
              cancelButton: CupertinoButton(
                child: Text('취소'),
                onPressed: (){
                  Navigator.of(context).pop();
                }),
            );
                });
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
