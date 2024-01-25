import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/firebase_options.dart';
import 'package:flash_chat_app/firebase_service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/screens/welcome_screen.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(FlashChat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .whenComplete(
    () => print('main:${DateTime.now().millisecondsSinceEpoch}'),
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build:${DateTime.now().millisecondsSinceEpoch}');
    return MaterialApp(initialRoute: Constants.welComeScreen, routes: {
      Constants.chatScreen: (context) {
        return ChatScreen();
      },
      Constants.logInScreen: (context) {
        return LoginScreen();
      },
      Constants.registerScreen: (context) {
        return RegistrationScreen();
      },
      Constants.welComeScreen: (context) {
        return WelcomeScreen();
      },
    });
  }
}
