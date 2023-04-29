import 'package:flutter/material.dart';
import 'package:news_app/ViewModel/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  NewsView({Key? key}) : super(key: key);
  late NewsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<NewsViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Text(viewModel.list[index].title.toString());
        },
        itemCount: viewModel.list.length,
      ),
    );
  }
}
