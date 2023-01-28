import 'package:flutter/material.dart';

class Count {
  int _count = 0;

  int get count => _count;

  void incrementCounter() {
    ++_count;
  }

  void decreaseCounter() {
    --_count;
  }
}
