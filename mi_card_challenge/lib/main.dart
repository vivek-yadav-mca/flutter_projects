import 'package:flutter/material.dart';

void main() {
  runApp(MicardChallenge());
}

class MicardChallenge extends StatelessWidget {
  MicardChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/squareimage.png'),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Vivek Yadav',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      letterSpacing: 3.0),
                ),
                SizedBox(
                  width: 250.0,
                  child: Divider(
                    color: Colors.indigo[200],
                  ),
                ),
                Card(
                  elevation: 50.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.indigo[900],
                    ),
                    title: Text(
                      '+91 9777078128',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900]),
                    ),
                  ),
                ),
                Card(
                  elevation: 50.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: ListTile(
                    leading:
                        Icon(Icons.email_outlined, color: Colors.indigo[900]),
                    title: Text(
                      'vivekyadav@example.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                          color: Colors.indigo[900]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
