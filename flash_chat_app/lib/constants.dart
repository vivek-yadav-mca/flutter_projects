import 'package:flutter/material.dart';

class Constants {
  static const String welComeScreen = 'welcomeScreenRoute';
  static const String registerScreen = 'registerScreenRoute';
  static const String logInScreen = 'logInScreenRoute';
  static const String chatScreen = 'chatScreenRoute';
  static const Color lightBlue = Color.fromRGBO(64, 196, 255, 1.0);
  static const Color lightBlueAcc = Color.fromRGBO(12, 124, 222, 1.0);
}

const InputDecoration kInputFieldDecor = InputDecoration(
  labelStyle: TextStyle(color: Colors.lightBlueAccent),
  prefixIconColor: Colors.lightBlueAccent,
  suffixIconColor: Colors.lightBlueAccent,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
