import 'package:flutter/cupertino.dart';
import 'package:news_app/Model/news.dart';
import 'package:news_app/Repository/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository _newsRepository;
  News _news = News();

  News get news => _news;

  NewsViewModel() {
    _newsRepository = NewsRepository();
    _getNews();
  }

  Future<void> _getNews() async {
    _news = await _newsRepository.getNews();
    notifyListeners();
  }
}
