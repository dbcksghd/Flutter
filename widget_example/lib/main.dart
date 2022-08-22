import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  List _buttonList = ['더하기', '빼기', '곱하기', '나누기']; //버튼 리스트에 들어갈 목록
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List.empty(growable: true);
  String? buttonText;
  String sum = '';
  TextEditingController value1 = TextEditingController(); //value1에 입력받기
  TextEditingController value2 = TextEditingController(); //value2에 입력받기

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(
          value: item,
          child: Text(item)
      ));
    }
    buttonText = _dropDownMenuItems[0].value;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center( //가운데 정렬
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '결과 : $sum',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,//숫자키패드 보여주기
                  controller: value1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                    child: Row( //가로정렬
                      children: <Widget>[
                        Icon(Icons.add), //더하기 아이콘
                        Text(buttonText!)
                      ],
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Colors.amber)),
                    onPressed: () { //버튼을 눌렀을때
                      setState(() {
                        var value1Int = double.parse(value1.value.text);//텍스트필드는 입력받은 데이터를 문자열로 인식함으로 정수형으로 바꿔주자
                        var value2Int = double.parse(value2.value.text);
                        var result;
                        if (buttonText == '더하기') {
                          result = value1Int + value2Int;
                        } else if (buttonText == '빼기') {
                          result = value1Int - value2Int;
                        } else if (buttonText == '곱하기') {
                          result = value1Int * value2Int;
                        } else {
                          result = value1Int / value2Int;
                        }
                        sum = '$result';
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButton(
                  items: _dropDownMenuItems,
                  onChanged: (String? value) {
                    setState(() {
                      buttonText = value;
                    });
                  },
                  value: buttonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}