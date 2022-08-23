import 'package:flutter/material.dart';
import 'package:tabbar_example/sub/firstPage.dart';
import 'package:tabbar_example/sub/secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
  with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'), //앱바 제목
      ),
      body: TabBarView(
        children: [
          FirstApp(),
          SecondApp()
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab( //탭 아이콘과 색깔
            icon: Icon(Icons.looks_one,
            color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(Icons.looks_two,
              color: Colors.blue,
            ),
          ),
        ],
        controller: controller,
      ),
    );
  }
  TabController? controller;

  @override
  void initState(){ //initState 함수 호출
    super.initState();
    controller = TabController(
        length: 2, //탭바 길이
        vsync: this);

    @override //state 객체 소멸
    void dispose(){
      controller!.dispose();
      super.dispose();
    }
 }
}