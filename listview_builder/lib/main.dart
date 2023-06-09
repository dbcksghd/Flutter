import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    'Dentist',
    'Pharmacist',
    'School teacher',
    'IT manager',
    'Account',
    'Lawyer',
    'Hairdresser',
    'Physician',
    'Web developer',
    'Medical Secretary'
  ];

  var imageList = [
    'image/1.png',
    'image/2.png',
    'image/3.png',
    'image/4.png',
    'image/5.png',
    'image/6.png',
    'image/7.png',
    'image/8.png',
    'image/9.png',
    'image/10.png'
  ];

  var description = [
    '1.There are different types of careers you can pursue in your life. Which one will it be?',
    '2.There are different types of careers you can pursue in your life. Which one will it be?',
    '3.There are different types of careers you can pursue in your life. Which one will it be?',
    '4.There are different types of careers you can pursue in your life. Which one will it be?',
    '5.There are different types of careers you can pursue in your life. Which one will it be?',
    '6.There are different types of careers you can pursue in your life. Which one will it be?',
    '7.There are different types of careers you can pursue in your life. Which one will it be?',
    '8.There are different types of careers you can pursue in your life. Which one will it be?',
    '9.There are different types of careers you can pursue in your life. Which one will it be?',
    '10.There are different types of careers you can pursue in your life. Which one will it be?'
  ];

  void showPopup(context, title, image, description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3, //description 데이터가 최대 몇줄까지 표시할지
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); //팝업창 사라지게
                  },
                  icon: const Icon(Icons.close), //버튼 아이콘
                  label: const Text('close'), //버튼에 들어갈 글씨
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6; // 디바이스의 가로길이의 60%
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: titleList.length, //10개만큼 만들어짐
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(titleList[index]);
                showPopup(context, titleList[index], imageList[index],
                    description[index]);
              },
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(imageList[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            titleList[index],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              description[index],
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.grey[500]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
