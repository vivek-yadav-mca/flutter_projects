import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromRGBO(5, 81, 93, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 33, 38, 1.0),
        centerTitle: true,
        title: Text(
          'Dice App',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Color.fromRGBO(255, 234, 16, 1.0)),
        ),
      ),
      body: DiceFlutterState(),
    ),
  ));
}

// class DiceFlutterChallenge extends StatelessWidget {
//   DiceFlutterChallenge({super.key});
//
//   @override
//   Widget build(BuildContext context) {}
// }

class DiceFlutterState extends StatefulWidget {
  DiceFlutterState({super.key});
  @override
  State<DiceFlutterState> createState() {
    return newDiceFlutterState();
  }
}

class newDiceFlutterState extends State<DiceFlutterState> {
  int leftDicenumber = 1;
  int rightDicenumber = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDicee();
              },
              child: Image.asset('images/dice$leftDicenumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDicee();
              },
              child: Image.asset('images/dice$rightDicenumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  void changeDicee() {
    setState(() {
      leftDicenumber = Random().nextInt(6) + 1;
      rightDicenumber = Random().nextInt(6) + 1;
    });
  }
}
