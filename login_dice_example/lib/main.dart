import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice game",
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){})
        ],
      ),
      body: Builder(
        builder:(context) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Center(
                      child: Image(
                        image: AssetImage('image/zzal.gif'),
                        width: 170.0,
                        height: 190.0,
                      ),
                    ),
                    Form(
                        child: Theme(
                            data: ThemeData(
                                primaryColor: Colors.teal,
                                inputDecorationTheme: InputDecorationTheme(
                                    labelStyle:
                                    TextStyle(
                                        color: Colors.teal,
                                        fontSize: 15.0))),
                            child: Container(
                              padding: EdgeInsets.all(40.0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                        labelText: '아이디를 입력해주세요.'
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  TextField(
                                    controller: textEditingController2,
                                    decoration: InputDecoration(
                                        labelText: '비밀번호를 입력해주세요.'
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  ButtonTheme(
                                      minWidth: 100.0,
                                      height: 50.0,
                                      child: RaisedButton(
                                          color: Colors.blue,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          onPressed: () {

                                            if(textEditingController.text == 'dice' &&
                                                textEditingController2.text == '1234'){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (BuildContext context)=>Dice()));
                                            }else if(textEditingController.text == 'dice' &&
                                                textEditingController2.text != '1234'){
                                              showSnackBar2(context);
                                            }else if(textEditingController.text != 'dice' &&
                                                textEditingController2.text == '1234'){
                                              showSnackBar3(context);
                                            }else {
                                              showSnackBar(context);
                                            }
                                          })
                                  ),
                                ],
                              ),
                            ),
                        ),
                    ),
                  ],
                ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context){
  Scaffold.of(context).showSnackBar(
    SnackBar(content:
    Text('로그인 정보를 다시 확인하세요.',
      textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}

void showSnackBar2(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('비밀번호가 일치하지 않습니다.',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}
void showSnackBar3(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('아이디를 확인해주세요.',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}