import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' show Random;
import 'dart:io';
import 'Game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  var number = 0;

  final r = Random();
  var count = 0;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    number = r.nextInt(101);
    return Scaffold(
        appBar: AppBar(title: const Text('GUESS THE NUMBER')),
        body: Container(
        margin: EdgeInsets.all(30.0),
    padding: EdgeInsets.all(0.0),
    decoration: BoxDecoration(
    border: Border.all(
    width: 10,
    color: Color(0xFFE3C6E8),
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    boxShadow: [
    BoxShadow(
    color: Colors.deepPurple.withOpacity(1.0),
    offset: const Offset(3.0, 5.0),
    blurRadius: 7.0,
    spreadRadius: 3.0,
    ),
    ],
    ),
    child: Container(
    color: Color(0xFFE3C6E8),
    child: Center(
    child: Column(
    //mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    //crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(
    'assets/images/guess_logo.png',
    width: 150.0,
    ),
    Container(
    margin: const EdgeInsets.only(left: 8.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
    Text(
    'GUESS',
    style: TextStyle(
    fontSize: 60.0,
    color: Colors.deepPurpleAccent),
    textAlign: TextAlign.center,
    ),

    Text(
    'THE NUMBER',
    style: TextStyle(
    fontSize: 30.0, color: Colors.deepPurple),
    textAlign: TextAlign.center,
    ),

    ],
    )),
    ],
    ),
    SizedBox(
    width: 300.0,
    height: 200.0,
    //ElevatedButton(onPressed: () {}, child: Text('RANDOM')),

    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextField(
    textAlign: TextAlign.center,
    controller: _controller,
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(0.5),
    border: OutlineInputBorder(),
    hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
    ),

    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: ButtonTheme(
    minWidth: 70.0,
    height: 40.0,
    child: RaisedButton(
    onPressed: () {
      var game = Game(number);
      var input = _controller.text;
      var guess = int.tryParse(input);
      if (guess == null || guess <= 0) {
        print("กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลข ʕ ﾟ ● ﾟʔ");

        showDialog(context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ERROR'),
                content: Text('กรอกข้อมูลไม่ถูกต้อง\nให้กรอกเฉพาะตัวเลข❌'),
                actions: [
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: Text('OK✅')),
                ],
              );
            });
      } else {
        var result = game.doGuess(guess);
        if (result == 1) {
          showDialog(context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('RESULT'),
                  content: Text('$guess มากเกินไป กรุณาลองใหม่❌'),
                  actions: [
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                        child: Text('OK✅')),
                  ],
                );
              });
          count++;
        }else if(result == -1){
          showDialog(context: context,
              barrierDismissible: false,
              builder:(BuildContext context){
                return AlertDialog(
                  title: Text('RESULT'),
                  content: Text('$guess น้อยเกินไป กรุณาลองใหม่❌'),
                  actions: [
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text('OK✅')),
                  ],
                );
              });
          count++;
        }else if(result == 0){
          count++;
          showDialog(context: context,
              barrierDismissible: false,
              builder:(BuildContext context){
                return AlertDialog(
                  title: Text('RESULT'),
                  content: Text('$guess ✨ถูกต้องแล้วครับ✨\nคุณทายไปทั้งหมด $count ครั้ง'),
                  actions: [
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text('OK✅')),
                  ],
                );
              });
        }
      }
    },
    child: Text(
    'GUESS',
    style: TextStyle(
    fontSize: 15.0, color: Colors.white),


    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    )),
    );
    }
  }
