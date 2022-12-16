import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('쿨타임 버튼 만들기'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: ElevatedButton(
              onPressed: () {
                if (!isClick) return null;
                print('출력');
                setState(() {
                  isClick = false;
                });
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    isClick = true;
                  });
                });
              },
              child: isClick ? const Text('버튼') : const CircularProgressIndicator(color: Colors.white,)),
        ),
      ),
    );
  }
}
