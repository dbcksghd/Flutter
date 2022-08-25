import 'package:flutter/cupertino.dart';
import 'firstPage.dart';
import 'secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
    ];

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: items),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FirstWidget();
            case 1:
              return SecondWidget();
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