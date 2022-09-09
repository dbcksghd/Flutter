import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  const SubDetail({Key? key}) : super(key: key);

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<String> todoList = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('부모님께 전화하기');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              //다양한 터치 이벤트를 처리할수 있게 해주는 위젯
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30.0),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/third',
                    arguments:
                        todoList[index]); //todolist의 인덱스에 있는 값을 thirdpage로 전달
              },
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async {
    //버튼을 누르면 두번째 페이지로 이동하고 반환하는 값을 저장해 할 일 목록에 추가하는 함수
    final result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String); //형변환
    });
  }
}
