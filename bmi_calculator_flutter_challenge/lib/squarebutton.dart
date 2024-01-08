import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  SquareButton(
      {required this.onPress,
      required this.child,
      required this.btnColor,
      this.radius = 15.0,
      this.vertical_margin = 8.0,
      this.horizontal_margin = 16.0,
      this.buttonHorizontal = 50.0,
      this.buttonVertical = 50.0});
  final VoidCallback onPress;
  final Widget child;
  final Color btnColor;
  final double radius;
  final double vertical_margin;
  final double horizontal_margin;
  final double buttonHorizontal;
  final double buttonVertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: vertical_margin, horizontal: horizontal_margin),
      child: RawMaterialButton(
        onPressed: onPress,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fillColor: btnColor,
        elevation: 25.0,
        constraints:
            BoxConstraints.tight(Size(buttonHorizontal, buttonVertical)),
        child: child,
      ),
    );
  }
}
