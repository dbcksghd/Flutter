import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoFlutterApp extends StatefulWidget {
  const CupertinoFlutterApp({Key? key}) : super(key: key);

  @override
  State<CupertinoFlutterApp> createState() => _CupertinoFlutterAppState();
}

class _CupertinoFlutterAppState extends State<CupertinoFlutterApp> {
  var _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 디자인'),
      ),
      body: Column(
        children: [
          CupertinoSwitch(
              value: _isOn,
              onChanged: (bool value){
                setState(() {
                  _isOn = value;
                });
              }
          ),
          SizedBox(
            width: 80,
            height: 80,
          ),
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
            width: 40,
            height: 40,
          ),
          SizedBox(
            child: Center(
              child: CupertinoActivityIndicator( //로딩 표시기 위젯
                radius: 20, //크기는 20정도
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          CupertinoButton(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.orange,
              child: Text('액션시트'),
              onPressed: (){
                showCupertinoModalPopup(
                    context: context,
                    builder: (context){
                      return CupertinoActionSheet(
                        title: Text('당신의 정치색은?',
                          style: TextStyle(
                              fontSize: 30
                          ),
                        ),
                        actions: [
                          CupertinoButton(
                              child: Text('빨강'),
                              onPressed: (){}
                          ),
                          CupertinoButton(
                              child: Text('파랑'),
                              onPressed: (){}
                          ),
                        ],
                        cancelButton: CupertinoButton(
                            child: Text('취소'),
                            onPressed: (){
                              Navigator.of(context).pop();
                            }),
                      );
                    });
              }
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}