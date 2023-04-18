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
  List<String> dataList = ["what", "whatf", "asdf", "asfas"];
  List<String> searchList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.grey,
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchList = search(value);
              });
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchList[index]),
          );
        },
      ),
    );
  }

  List<String> search(String query) {
    List<String> result = [];
    for (String a in dataList) {
      if (a.contains(query)) {
        result.add(a);
      }
    }
    return result;
  }
}
