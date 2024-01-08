import 'package:bmi_calculator_flutter_challenge/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'color.dart';
import 'constants.dart';
import 'squarebutton.dart';
import 'result_brain.dart';

const String lowerBtnTxt = 'CALCULATE BMI';

enum Gendernames {
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int height = 160;
  int weight = 60;
  int age = 20;
  Gendernames SelectedGender = Gendernames.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constants.appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: SelectedGender == Gendernames.male
                        ? Colour.activeCardColor
                        : Colour.inactiveCardColor,
                    onPress: () {
                      setState(() {
                        SelectedGender = Gendernames.male;
                      });
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: Constants.iconSize,
                          color: Colour.iconColorwhite,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'MALE',
                          style: Constants.cardGenderTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: SelectedGender == Gendernames.female
                        ? Colour.activeCardColor
                        : Colour.inactiveCardColor,
                    onPress: () {
                      setState(() {
                        SelectedGender = Gendernames.female;
                      });
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: Constants.iconSize,
                          color: Colour.iconColorwhite,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'FEMALE',
                          style: Constants.cardGenderTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: Colour.inactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Constants.heightCardTitle,
                    style: Constants.cardGenderTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                          style: Constants.cardNumberTextStyle),
                      Text(
                        'cm',
                        style: Constants.cardGenderTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    min: 90.0,
                    max: 220.0,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                    overlayColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.dragged)) {
                        return Colour.sliderButtonOverlayColor;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return Colour.iconColorwhite;
                      }
                      return Colors.transparent;
                    }),
                    activeColor: Colour.sliderButtonColor,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: Colour.inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Constants.weightCardTitle,
                          style: Constants.cardGenderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: Constants.cardNumberTextStyle,
                            ),
                            Text(
                              'KG',
                              style: Constants.cardGenderTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SquareButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              btnColor: Colour.sliderButtonColor,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colour.iconColorwhite,
                              ),
                            ),
                            SquareButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              btnColor: Colour.sliderButtonColor,
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colour.iconColorwhite,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: Colour.inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Constants.ageCardTitle,
                          style: Constants.cardGenderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: Constants.cardNumberTextStyle,
                            ),
                            Text(
                              'yr',
                              style: Constants.cardGenderTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SquareButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              btnColor: Colour.sliderButtonColor,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colour.iconColorwhite,
                              ),
                            ),
                            SquareButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              btnColor: Colour.sliderButtonColor,
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colour.iconColorwhite,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: SquareButton(
              onPress: () {
                ResultBrain resultBrain =
                    ResultBrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiValue: resultBrain.getBmi(),
                    adviceString: resultBrain.getInterpretation(),
                    resultName: resultBrain.getResult(),
                  );
                }));
              },
              child: Text(
                lowerBtnTxt,
                style: Constants.cardGenderTextStyle,
              ),
              btnColor: Colour.sliderButtonColor,
              radius: 20.0,
              horizontal_margin: 8.0,
            ),
          )
        ],
      ),
    );
  }
}
