import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _count = 0;
  int get count => _count; //_count에 접근할 수 있도록 만들어줌

  void add(){
    _count++;
    notifyListeners(); //데이터가 갱신되었음을 알림
  }

  void remove(){
    _count--;
    notifyListeners();
  }

}