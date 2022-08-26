import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoThirdPage extends StatefulWidget {
  const CupertinoThirdPage({Key? key}) : super(key: key);

  @override
  State<CupertinoThirdPage> createState() => _CupertinoThirdPageState();
}

class _CupertinoThirdPageState extends State<CupertinoThirdPage> {
  var _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
        middle: Text('쿠퍼티노 디자인'),
        trailing: CupertinoButton(
          child: Icon(Icons.exit_to_app),
          onPressed: (){},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(50),
          ),
          CupertinoTextField(
            decoration: BoxDecoration(
              color: CupertinoColors.extraLightBackgroundGray,
              border: Border.all(
                color: CupertinoColors.lightBackgroundGray,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(50)
          ),
          CupertinoSlider(
              value: _value.toDouble(),
              onChanged: (index){
                setState(() {
                  _value = index.toInt();
                });
              },
            max: 100,
            min: 1,
          ),
          Text(_value.toInt().toString())
        ],
      ),
    );
  }
}
