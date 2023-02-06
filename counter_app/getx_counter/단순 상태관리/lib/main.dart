import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_state_management/controller/count_controller.dart';

void main() => runApp(GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 카운터 앱'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            GetBuilder<CountController>(
              builder: (controller) => Text(controller.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
          ],
        ),
      ),
    );
  }
}
