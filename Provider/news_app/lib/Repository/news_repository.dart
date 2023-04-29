import 'package:news_app/DataSource/data_source.dart';
import 'package:news_app/Model/news.dart';

class NewsRepository {
  final DataSource _dataSource = DataSource();

  Future<News> getNews() => _dataSource.getNews();
}
