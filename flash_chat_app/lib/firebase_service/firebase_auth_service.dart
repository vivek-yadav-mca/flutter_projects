import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_constants.dart';

class FirebaseAuthService {
  final auth = FirebaseAuth.instance;

  late BuildContext context;
  late String userEmail;
  late String userPassword;

  Future<User?> createUserWithPassword(
      {required context, required userEmail, required userPassword}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      final User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == kErrorWeakPassword) {
        showSnackBar('Password must have 6 character !!!');
      } else if (e.code == kErrorEmailAlreadyExist) {
        showSnackBar('The account already exists for $userEmail');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<User?> logInUserWithPass(
      {required context, required userEmail, required userPassword}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      final User? user = await result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == kErrorUserNotFound) {
        showSnackBar('User not found for given e-mail');
      } else if (e.code == kErrorWrongPassword) {
        showSnackBar('Wrong Password');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> getCurrentUser() async {
    try {
      final user = await auth.currentUser!;
      return user;
    } catch (e) {
      print(e);
    }
    return null;
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
