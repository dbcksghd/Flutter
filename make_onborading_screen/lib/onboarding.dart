import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:make_onborading_screen/main.dart'; //온보딩스크린 패키지

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'Welcome to AndroidStudio',
            body: 'This is the first Page',
            image: Image.asset('image/android.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'Welcome to Swift',
            body: 'This is the second Page',
            image: Image.asset('image/swift.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'Welcome to Flutter',
            body: 'This is the third Page',
            image: Image.asset('image/flutter.png'),
            decoration: getPageDecoration())
      ],
      done: const Text('시작하기'),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyPage()),
        );
      },
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(
          color: Colors.cyan,
          size: const Size(10, 10),
          activeSize: Size(15, 15),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          activeColor: Colors.red),
      curve: Curves.easeInOut,
    );
  }
}

PageDecoration getPageDecoration() {
  return PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Colors.white);
}
