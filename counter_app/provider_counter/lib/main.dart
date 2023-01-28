import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/count_provider.dart';
import 'screen/my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CountProvider(),
        child: MyHomePage(),
      ),
    );
  }
}
