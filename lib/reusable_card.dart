import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.state, this.color, this.cardChild});

  final Color color;
  final Widget cardChild;
  final Function state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
