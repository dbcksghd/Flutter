import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_state_management/controller/count_controller.dart';

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
            Obx(
              () => Text(
                controller.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
