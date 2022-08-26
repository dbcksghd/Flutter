import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'firstPage.dart';
import 'secondPage.dart';
import 'thirdPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_circle_fill))
    ];

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: items),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FirstWidget();
            case 1:
              return SecondWidget();
            case 2:
              return ThirdWidget();
            default:
              return FirstWidget();
          }
        }
    );
  }
}

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoFirstPage();
  }
}

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoSecondPage();
  }
}

class ThirdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoThirdPage();
  }
}
