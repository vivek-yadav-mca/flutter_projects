import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_app/firebase_service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/constants.dart';

final fireStore = FirebaseFirestore.instance;
User? loggedinUser;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgTextController = TextEditingController();
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  late String msgText;

  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    loggedinUser = await firebaseAuthService.getCurrentUser();
  }

  // void getMessages() async {
  //   final msgs = await fireStore.collection('messages').get();
  //   for (var msg in msgs.docs) {
  //     print(msg.data());
  //   }
  // }

  // void getSnapShot() async {
  //   await for (var snapshot in fireStore.collection('messages').snapshots()) {
  //     for (var msg in snapshot.docs) {
  //       print(msg.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                if (loggedinUser != null) {
                  await FirebaseAuth.instance.signOut();
                  print('signed out');
                }
                Navigator.pushNamed(context, Constants.welComeScreen);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Streambuild(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgTextController,
                      onChanged: (value) {
                        msgText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      msgTextController.clear();
                      fireStore
                          .collection('messages')
                          .add({'user': loggedinUser?.email, 'text': msgText});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Streambuild extends StatelessWidget {
  const Streambuild({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: fireStore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final msgs = snapshot.data?.docs;
          List<TextBubble> textWidget = [];
          for (var msg in msgs!) {
            final textMsg = msg.get('text');
            final textSender = msg.get('user');
            final currentUser = loggedinUser?.email;
            final textWid = TextBubble(
                user: textSender,
                text: textMsg,
                isMe: currentUser == textSender);
            textWidget.add(textWid);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: textWidget,
            ),
          );
        });
  }
}

class TextBubble extends StatelessWidget {
  @override
  late String user;
  late String text;
  late bool isMe;
  TextBubble({required this.user, required this.text, required this.isMe});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$user',
            style: TextStyle(fontSize: 10.0),
          ),
          Material(
            elevation: 15.0,
            color: isMe ? Colors.lightBlue : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: isMe
                        ? Radius.circular(30.0)
                        : Radius.elliptical(10.0, 0.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: isMe
                        ? Radius.elliptical(10.0, 0.0)
                        : Radius.circular(30.0))),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 15.0, color: isMe ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
