import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var switchValue = false;
  String test = 'hello';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text('$test'),
                  onPressed: () {
                    if (test == 'hello') {
                      setState(() {
                        test = 'flutter';
                      });
                    } else {
                      setState(() {
                        test = 'hello';
                      });
                    }
                  })),
        ));
  }
}
