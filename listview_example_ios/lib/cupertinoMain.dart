import 'package:flutter/cupertino.dart';
import 'package:listview_example_ios/iosSub/cupertinoSecondPage.dart';
import 'animalItem.dart';
import 'iosSub/cupertinoFirstPage.dart';

class CupertinoMain extends StatefulWidget {
  const CupertinoMain({Key? key}) : super(key: key);

  @override
  State<CupertinoMain> createState() => _CupertinoMainState();
}

class _CupertinoMainState extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;
  List<Animal> animalList = List.empty(growable: true); //크기가 늘어날 수 있음을 알려주는 growable를 true로 두고 빈 List를 생성

  @override
  void initState(){
    super.initState();
    tabBar = CupertinoTabBar( //ios 디자인들은 앞에 쿠퍼티노를 붙일것
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
        ]
    );
    animalList.add(Animal(animalName: "벌", kind: "곤충", imagePath: "repo/images/bee.png"));
    animalList.add(Animal(animalName: "고양이", kind: "포유류", imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName: "젖소", kind: "포유류", imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName: "강아지", kind: "포유류", imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName: "여우", kind: "포유류", imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName: "원숭이", kind: "영장류", imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(animalName: "돼지", kind: "포유류", imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName: "늑대", kind: "포유류", imagePath: "repo/images/wolf.png"));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar!,
        tabBuilder: (context, value){
          if (value == 0){
            return CupertinoFirstPage(
              animalList: animalList,
            );
          } else {
            return CupertinoSecondPage(
              animalList: animalList,
            );
          }
        }),
    );
  }
}
