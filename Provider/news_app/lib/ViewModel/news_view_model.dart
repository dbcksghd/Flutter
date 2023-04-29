import 'package:flutter/cupertino.dart';
import 'package:news_app/Model/articles.dart';
import 'package:news_app/Repository/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository _newsRepository;
  List<Articles> _list = List.empty(growable: true);

  List<Articles> get list => _list;

  NewsViewModel() {
    _newsRepository = NewsRepository();
    _getArticles();
  }

  Future _getArticles() async {
    _list = await _newsRepository.getArticleList();
    notifyListeners();
  }
}
