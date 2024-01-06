import 'package:flutter/material.dart';
import 'questionbrain.dart';

QuestionBrain questionBrain = QuestionBrain();
void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  MyQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black12,
          title: Text(
            'Quiz',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.white),
          ),
        ),
        body: MyQuizAppStateFul(),
      ),
    );
  }
}

class MyQuizAppStateFul extends StatefulWidget {
  MyQuizAppStateFul({super.key});

  State<MyQuizAppStateFul> createState() {
    return MyQuizStateCreate();
  }
}

class MyQuizStateCreate extends State<MyQuizAppStateFul> {
  List<Icon> icon = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                questionBrain.getQuestion(),
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'PT Serif',
                    color: Colors.deepOrange,
                    fontSize: 25.0),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 128.0, vertical: 16.0),
          child: Expanded(
            child: OutlinedButton(
              child: Text('True'),
              onPressed: () {
                setState(() {
                  if (questionBrain.getAnswer() == true) {
                    icon.add(Icon(Icons.check));
                  } else {
                    icon.add(Icon(Icons.close));
                  }
                  questionBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 128.0, vertical: 16.0),
          child: Expanded(
            child: OutlinedButton(
              child: Text('False'),
              onPressed: () {
                setState(() {
                  if (questionBrain.getAnswer() == false) {
                    icon.add(Icon(Icons.check));
                  } else {
                    icon.add(Icon(Icons.close));
                  }
                  questionBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: icon,
          ),
        )
      ],
    );
  }
}
