import 'package:flutter/material.dart';

class Animal{
  String? imagePath; //동물 이미지 경로 변수
  String? animalName; //동물 이름 변수
  String? kind; //동물 종류 변수
  bool? flyExist = false; //날수 있는지 여부(디폴트값을 false로 지정)

  Animal(
  {
    required this.animalName, //required를 붙이면 꼭 전달해야 한다는 뜻
    required this.kind,
    required this.imagePath,
    this.flyExist});
}