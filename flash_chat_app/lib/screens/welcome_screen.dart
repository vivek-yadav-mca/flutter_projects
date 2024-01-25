import 'package:flash_chat_app/components/gradienText.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/main.dart';
import 'package:flash_chat_app/components/button_functionality.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: GradientText(
          colors: [Colors.red, Colors.amber, Colors.green, Colors.blue],
          child: Text(
            'Flash Chat App',
            style: kTitleTextStyle,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'Logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonFunctionaliy(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, Constants.logInScreen);
                });
              },
              text: 'Log In',
            ),
            ButtonFunctionaliy(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, Constants.registerScreen);
                });
              },
              text: 'Register',
              color: Constants.lightBlueAcc,
            ),
          ],
        ),
      ),
    );
  }
}
