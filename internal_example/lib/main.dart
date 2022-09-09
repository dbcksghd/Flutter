import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _setData(int value) async {
    ///카운트값을 저장하는 함수
    var key = 'count';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  void _loadData() async {
    ///카운트값을 가져오는 함수
    var key = 'count';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      var value = preferences.getInt(key);
      if (value == null) {
        _counter = 0;
      } else {
        _counter = value;
      }
    });
  }

  @override
  void initState() { ///앱을 재실행 할때마다 저장되어있던 카운트값을 불러옴
    super.initState();
    _loadData();
  }

  void _incrementCounter() { ///플로팅버튼을 눌렀을 때 카운터를 올리고 _setData로 카운트값을 저장함
    setState(() {
      _counter++;
      _setData(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
