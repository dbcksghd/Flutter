import 'package:flutter/cupertino.dart';
import '../animalItem.dart';

class CupertinoSecondPage extends StatefulWidget {
  final List<Animal>? animalList;
  const CupertinoSecondPage({Key? key, required this.animalList}) : super(key: key);

  @override
  State<CupertinoSecondPage> createState() => _CupertinoSecondPageState();
}

class _CupertinoSecondPageState extends State<CupertinoSecondPage> {
  TextEditingController? _textController; //동물 이름
  int _kindChoice = 0; //동물 종류
  bool _flyExist = false; //날개 유무
  String? _imagePath; //동물 이미지
  Map<int, Widget> segmentWidgets = { //정수형 키와 위젯형 값을 쌍으로 하는 자료형 Map
    0: SizedBox( //영역을 만들어주는 SizedBox
      child: Text('양서류',
          textAlign: TextAlign.center
      ),
      width: 80,
    ),
    1: SizedBox(
      child: Text('포유류',
      textAlign: TextAlign.center
      ),
      width: 80,
    ),
    2: SizedBox(
      child: Text('파충류',
      textAlign: TextAlign.center,
      ),
      width: 80,
    )
  };

  @override
  void initState(){
    super.initState();
    _textController = TextEditingController(); //텍스트 필드를 사용하기 위한 텍스트에디팅컨트롤러
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('동물 추가'),
      ),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoTextField( //ios 스타일 입력 창
                  controller: _textController,
                  keyboardType: TextInputType.text, //텍스트 키보드
                  maxLines: 1, //최대 1줄
                ),
              ),
              CupertinoSegmentedControl(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  groupValue: _kindChoice, //0으로 초기화한 동물 종류 값 넣기
                  children: segmentWidgets,
                  onValueChanged: (int value) { //값이 바뀌었을때 동작할 이벤트들
                    setState(() {
                      _kindChoice = value;
                    });
                  }),
              Row(
                children: <Widget>[
                  Text('날개가 존재합니까?'),
                  CupertinoSwitch( //동물의 날개 유무를 묻는 ios스타일 스위치
                    value: _flyExist,
                    onChanged: (value) {
                      setState(() {
                        _flyExist = value;
                      });
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal, //가로로 스크롤할 리스트뷰
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('repo/images/cow.png'),
                      onTap: () {
                        _imagePath = 'repo/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/pig.png'),
                      onTap: () {
                        _imagePath = 'repo/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/bee.png'),
                      onTap: () {
                        _imagePath = 'repo/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/cat.png'),
                      onTap: () {
                        _imagePath = 'repo/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png'),
                      onTap: () {
                        _imagePath = 'repo/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png'),
                      onTap: () {
                        _imagePath = 'repo/images/monkey.png';
                      },
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                  child: Text('동물 추가하기'),
                  onPressed: () {
                    widget.animalList?.add(Animal(
                        animalName: _textController?.value.text,
                        kind: getKind(_kindChoice),
                        imagePath: _imagePath,
                        flyExist: _flyExist));
                  }),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
  getKind(int radioValue){ //동물 종류를 세그먼트를 눌렀을때 주는 값으로 각 값을 리턴
    switch(radioValue){
      case 0:
        return "양서류";
      case 1:
        return "포유류";
      case 2:
        return "파충류";
    }
  }
}