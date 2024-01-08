import 'package:bmi_calculator_flutter_challenge/result_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0a0e21),
          ),
          scaffoldBackgroundColor: Color(0xFF0a0e21)),
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => HomePage(),
      },
    );
  }
}
