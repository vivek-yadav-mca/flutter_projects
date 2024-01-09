import 'package:flutter/material.dart';
import 'constants.dart';
import 'color.dart';
import 'reusable_card.dart';
import 'squarebutton.dart';

const String resultHeading = 'YOUR RESULT';
const String bottomButtonTxt = 'Re-Calculate BMI';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmiValue,
      required this.adviceString,
      required this.resultName});
  final String resultName;
  final String bmiValue;
  final String adviceString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constants.appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              resultHeading,
              style: Constants.cardNumberTextStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resultName,
                    style: Constants.resultTextStyle,
                  ),
                  Text(
                    bmiValue.toString(),
                    style: Constants.resultNumberTextStyle,
                  ),
                  Text(
                    adviceString,
                    style: Constants.cardGenderTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              cardColor: Colour.inactiveCardColor,
              onPress: () {},
            ),
          ),
          SquareButton(
            onPress: () {
              Navigator.pop(context);
            },
            child: Text(
              bottomButtonTxt,
              style: Constants.cardGenderTextStyle,
            ),
            btnColor: Colour.sliderButtonColor,
            buttonHorizontal: double.infinity,
          ),
        ],
      ),
    );
  }
}
