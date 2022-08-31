import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
          children: [
            Padding(
              padding: EdgeInsets.all(32.0), //패딩으로 감싼 위젯을 전체 부분에서 32만큼 띄어줌
              child: Row(
                children: [
                  Expanded( //화면에서 차지할수 있는 부분 끝까지
                    child: Image.asset(
                        'image/dice$leftDice.png'
                    ),
                  ),
                  SizedBox(
                    width: 20.0, //주사위 두개 거리 띄우기
                  ),
                  Expanded(
                    child: Image.asset(
                        'image/dice$rightDice.png'
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: RaisedButton(
                child: Icon(Icons.play_arrow,
                color: Colors.white,
                size: 50.0
                ),
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    leftDice = Random().nextInt(6)+1;
                    rightDice = Random().nextInt(6)+1;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
