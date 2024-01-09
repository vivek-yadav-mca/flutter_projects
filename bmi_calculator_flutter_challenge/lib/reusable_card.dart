import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardColor, required this.cardChild, this.onPress});
  final Color? cardColor;
  final Widget cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
