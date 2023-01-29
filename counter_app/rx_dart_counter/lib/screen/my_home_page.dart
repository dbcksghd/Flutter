import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  final counter = BehaviorSubject<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RxDart 카운터 앱')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            StreamBuilder<int>(
              stream: counter.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return Text('0',
                    style: Theme.of(context).textTheme.headlineMedium);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counter.add(++count),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => counter.add(--count),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
