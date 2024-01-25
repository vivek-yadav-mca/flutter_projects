import 'package:flash_chat_app/firebase_service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/components/button_functionality.dart';
import 'package:flash_chat_app/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userEmail = '';
  String _userPassword = '';
  final TextEditingController _emailController = TextEditingController();
  late bool _passWordVisiblity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'Logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/login.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              onChanged: (value) {
                _userEmail = value;
              },
              decoration: kInputFieldDecor.copyWith(
                labelText: 'Email id',
                prefixIcon: Icon(Icons.email_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    _emailController.clear();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              // obscuringCharacter: userPassword,
              obscureText: _passWordVisiblity,
              onChanged: (value) {
                _userPassword = value;
              },
              decoration: kInputFieldDecor.copyWith(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passWordVisiblity = _passWordVisiblity ? false : true;
                    });
                  },
                  icon: Icon(
                    _passWordVisiblity
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ButtonFunctionaliy(
              onPressed: () async {
                if (_userEmail.isNotEmpty && _userPassword.isNotEmpty) {
                  dynamic result = await FirebaseAuthService()
                      .logInUserWithPass(
                          context: context,
                          userEmail: _userEmail,
                          userPassword: _userPassword);
                  if (result != null) {
                    Navigator.pushReplacementNamed(
                        context, Constants.chatScreen);
                  }
                } else {
                  showSnackBar('Email/PassWord field can\'t be Empty!!');
                }
              },
              text: 'Log In',
              color: Constants.lightBlueAcc,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      width: (MediaQuery.of(context).size.width * 0.9),
      duration: Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ));
  }
}
