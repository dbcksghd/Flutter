import 'package:flutter/material.dart';
import '../animalItem.dart'; //Animal 클래스 사용을 위한 임포트

class FirstApp extends StatelessWidget {
  final List<Animal>? list; //Animal 리스트 선언
  FirstApp({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder( //리스트뷰를 위젯으로 만들기 위해 리스트뷰 빌더를 쓴다
            itemBuilder: ( // 저걸 쓰기 위해서는 아이템 빌더가 필요함
            context, position){
              return GestureDetector( //터치 이벤트를 처리하게 위해 사용함
                child: Card( //이 부분에 위젯을 이용해 데이터를 표시
                  child: Row(
                  children: <Widget>[
                    Image.asset(
                      list![position].imagePath!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(list![position].animalName!)
                  ],
                ),
              ),
                onTap: (){ //동물을 터치했을때 나오게 할 것들
                  AlertDialog dialog = AlertDialog( //알림 창 만들기
                    content: Text( //내용 채우기
                      '이 동물은 ${list![position].kind}입니다.',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog
                  );
                },
              );
            },
            itemCount: list!.length //아이템의 개수만큼만 스크롤 할수 있게 제한
          ),
          ),
        ),
    );
  }
}
