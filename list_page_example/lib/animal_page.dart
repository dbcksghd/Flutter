import 'package:flutter/material.dart';
import 'package:list_page_example/model.dart';
import 'package:like_button/like_button.dart';

class AnimalPage extends StatefulWidget { //좋아요 버튼이 눌리면 화면이 바뀌므로 stf위젯
  const AnimalPage({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animal.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: Image.asset(widget.animal.imgPath),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '사는 곳: ' + widget.animal.location,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            LikeButton(
              size: 30.0,
              isLiked: isLiked,
              likeCount: likeCount,
            ),
          ],
        ),
      ),
    );
  }
}
