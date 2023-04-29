import 'package:flutter/material.dart';
import 'package:news_app/View/news_view.dart';
import 'package:news_app/ViewModel/news_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<NewsViewModel>(
        create: (context) => NewsViewModel(),
        child: NewsView(),
      ),
    );
  }
}
