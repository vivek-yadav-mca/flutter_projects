import 'package:flutter/material.dart';
import 'color.dart';

class Constants {
  static const double iconSize = 100.0;
  static const TextStyle cardGenderTextStyle = TextStyle(
      fontWeight: FontWeight.w900,
      color: Colour.iconColorwhite,
      fontSize: 20.0);
  static const TextStyle cardNumberTextStyle = TextStyle(
      color: Colour.iconColorwhite,
      fontWeight: FontWeight.bold,
      fontSize: 50.0);
  static const TextStyle resultNumberTextStyle = TextStyle(
      color: Colour.iconColorwhite,
      fontWeight: FontWeight.bold,
      fontSize: 150.0);
  static const TextStyle resultTextStyle = TextStyle(
      color: Colour.textColorLimeGreen,
      fontWeight: FontWeight.bold,
      fontSize: 30.0);
  static const String heightCardTitle = 'HEIGHT';
  static const String weightCardTitle = 'WEIGHT';
  static const String ageCardTitle = 'AGE';
  static AppBar appBar = AppBar(
    centerTitle: true,
    title: const Text(
      'BMI CALCULATOR',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
