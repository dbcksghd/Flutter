import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoThirdPage extends StatefulWidget {
  const CupertinoThirdPage({Key? key}) : super(key: key);

  @override
  State<CupertinoThirdPage> createState() => _CupertinoThirdPageState();
}

class _CupertinoThirdPageState extends State<CupertinoThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 디자인'),
      ),
      body: Column(
        children: [
        CupertinoTextField(
        decoration: BoxDecoration(
          color: CupertinoColors.extraLightBackgroundGray,
          border: Border.all(
            color: CupertinoColors.lightBackgroundGray,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
        ],
      ),
    );
  }
}
