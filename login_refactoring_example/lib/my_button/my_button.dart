import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.image,
    required this.text,
    required this.color,
    required this.radius,
    required this.onPressed});

  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed; //callback == 메소드

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/glogo.png'),
            Text(
              'Login with Google',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            Opacity(
              opacity: 0.0,
              child: Image.asset('images/glogo.png'),
            ),
          ],
        ),
        color: Colors.white,
        onPressed: () {},
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );
  }
}
