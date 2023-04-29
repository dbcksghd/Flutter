import 'dart:convert';

import 'package:news_app/Model/news.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/private.dart';

class DataSource {
  Future<News> getNews() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body));
    }
    throw Exception("데이터 받아오기 실패");
  }
}
