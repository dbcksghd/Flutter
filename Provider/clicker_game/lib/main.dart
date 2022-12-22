import 'package:clicker_game/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) {
          return Counter();
        },
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late Counter counter;

  @override
  Widget build(BuildContext context) {
    counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      body: CountNumber(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => counter.add(),
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => counter.remove(),
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}


class CountNumber extends StatelessWidget {
  const CountNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Counter>(
        builder: (context, counter, child) {
          return Text(
            Provider.of<Counter>(context).count.toString(),
            style: TextStyle(fontSize: 60),
          );
        },
      ),
    );
  }
}
