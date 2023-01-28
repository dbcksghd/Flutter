import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/provider/count_provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
}
