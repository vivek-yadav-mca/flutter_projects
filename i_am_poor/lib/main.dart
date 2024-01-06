import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(13, 246, 115, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(236, 124, 11, 1.0),
          centerTitle: true,
          title: Text(
            'I Am Poor',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Color.fromRGBO(7, 14, 61, 1.0)),
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/iampoor.png'),
          ),
        ),
      ),
    ),
  );
}
