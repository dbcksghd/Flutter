import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScreenA"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 정가운데 배치
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text("Go To ScreenB"),
              onPressed: (){
                Navigator.pushNamed(context, "/b");
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("Go To ScreenC"),
              onPressed: (){
                Navigator.pushNamed(context, "/c");
              },
            )
          ],
        ),
      ),
    );
  }
}