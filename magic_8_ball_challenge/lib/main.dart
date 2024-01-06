import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Magic8Ball());
}

class Magic8Ball extends StatelessWidget {
  Magic8Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 193, 7, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 160, 0, 1.0),
          centerTitle: true,
          title: Text(
            'Ask Me Anything',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1.0),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Magic8BallState(),
      ),
    );
  }
}

class Magic8BallState extends StatefulWidget {
  Magic8BallState({super.key});

  @override
  State<Magic8BallState> createState() {
    return ChangeState();
  }
}

class ChangeState extends State<Magic8BallState> {
  @override
  int ballnum = 1;
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    ballnum = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset('images/ball$ballnum.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
