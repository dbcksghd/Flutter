import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key, required this.onNext});

  final Function onNext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => onNext(),
        child: const Text("이동하기 22"),
      ),
    );
  }
}

class Screen22 extends StatelessWidget {
  const Screen22({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("screen22"),
      ),
    );
  }
}
