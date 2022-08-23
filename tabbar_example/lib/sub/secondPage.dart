import 'package:flutter/material.dart';

class SecondApp extends StatelessWidget {
  const SecondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('두 번째 페이지'),
        ),
      ),
    );
  }
}
