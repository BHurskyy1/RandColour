import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyPage()));
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final Random _random = Random();

  Color _color = Color(0xFFFFFFFF);
  Color _colorRev = Color(0xFB36213B);
  String _colorName = 'Hey, there!';
  void changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        //or with fromRGBO with fourth arg as _random.nextDouble(),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1);
      _colorRev = Color.fromRGBO(
        //or with fromRGBO with fourth arg as _random.nextDouble(),
          256-_color.red,
          256-_color.green,
          256-_color.blue,
          1);
        _colorName= 'red: ${_color.red}, green: ${_color.green}, blue: ${_color.blue}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: InkWell(
        onTap: changeColor,
        child: Container(
          color: _color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                          _colorName, style: TextStyle(
                          color: _colorRev,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))))
           ],
          ),
        ),
      ),
    );
  }
}