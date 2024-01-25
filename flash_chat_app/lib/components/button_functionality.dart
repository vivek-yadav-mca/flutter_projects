import 'package:flutter/material.dart';
import 'package:flash_chat_app/constants.dart';

class ButtonFunctionaliy extends StatelessWidget {
  late Color color;
  late String text;
  VoidCallback onPressed;

  ButtonFunctionaliy(
      {this.color = Constants.lightBlue,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
