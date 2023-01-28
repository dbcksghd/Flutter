import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/screen/count_home.dart';
import 'package:provider_counter/provider/count_provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로바이더 카운터 앱'),
      ),
      body: const CountHome(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _countProvider.incrementCounter(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => _countProvider.decreaseCounter(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}