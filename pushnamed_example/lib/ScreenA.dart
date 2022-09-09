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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/b");
              },
              child: Text("Go To Screen B"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/c");
              },
              child: Text("Go To Screen C"),
            ),
          ],
        ),
      ),
    );
  }
}
