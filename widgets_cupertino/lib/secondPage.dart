import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSecondPage extends StatefulWidget {
  const CupertinoSecondPage({Key? key}) : super(key: key);

  @override
  State<CupertinoSecondPage> createState() => _CupertinoSecondPageState();
}

class _CupertinoSecondPageState extends State<CupertinoSecondPage> {
  FixedExtentScrollController? firstController;

  @override
  void initState(){
    super.initState();
    firstController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              CupertinoButton(
                child: Text('쿠퍼티노 피커 버튼'),
                onPressed: (){
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context){
                        return Container(
                          height: 400,
                          child: Column(
                            children: [
                              Expanded(
                                  child: CupertinoPicker(
                                    itemExtent: 30,
                                    backgroundColor: Colors.white,
                                    scrollController: firstController,
                                    onSelectedItemChanged: (index){},
                                    children: List<Widget>.generate(31, (index){
                                      return Center(
                                        child: TextButton(
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              (++index).toString(),
                                          )),
                                      );
                                    }),
                                  ),
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('취소'))
                            ],
                          ),
                        );
                      },
                  );
                }),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
    );
  }
}
