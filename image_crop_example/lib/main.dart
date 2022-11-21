import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.width,
            ),
            child: GestureDetector(
              onTap: () {
                _showBottomSheet();
              },
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  size: imageSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사진찍기'),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 3),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('갤러리에서 불러오기'),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
