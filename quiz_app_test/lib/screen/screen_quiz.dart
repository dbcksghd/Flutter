import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';


class QuizScreen extends StatefulWidget {
  List<Quiz>? quizs;
  QuizScreen({this.quizs});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1]; //사용자의 정답을 담아놓을 공간
  List<bool> _answerState = [false, false, false, false]; //보기는 4개가 주어짐
  int _currentIndex = 0; //지금 어떤 문제를 보고있는지
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.deepPurple
              ),
            ),
            width: width * 0.85,
            height: height * 0.5,
          ),
        ),
      ),
    );
  }
}
