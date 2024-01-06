import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyXylophone(),
  ));
}

class MyXylophone extends StatelessWidget {
  MyXylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(48, 63, 159, 1.0),
        title: Text(
          'Xylophone App',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 255, 255, 1.0)),
        ),
      ),
      body: MyXyloStateful(),
    );
  }
}

class MyXyloStateful extends StatefulWidget {
  MyXyloStateful({super.key});

  @override
  State<MyXyloStateful> createState() {
    return MyListOfStates();
  }
}

class MyListOfStates extends State<MyXyloStateful> {
  Widget ButtonMaker(int btnnum, Color btnclr, String btntxt) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          final AudioPlayer player = AudioPlayer();
          player.play(AssetSource('note$btnnum.wav'));
        },
        child: Container(
          child: Center(
            child: Text(
              '$btntxt',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          width: double.infinity,
        ),
        style: ElevatedButton.styleFrom(
            enableFeedback: false, backgroundColor: btnclr),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ButtonMaker(1, Colors.red, 'Do'),
          ButtonMaker(2, Colors.orange, 'Re'),
          ButtonMaker(3, Colors.yellow, 'Mi'),
          ButtonMaker(4, Colors.green, 'Fa'),
          ButtonMaker(5, Colors.blue, 'So'),
          ButtonMaker(6, Colors.teal, 'La'),
          ButtonMaker(7, Colors.purple, 'Si'),
        ],
      ),
    );
  }
}
