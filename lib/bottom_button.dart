import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.screen, @required this.text});

  final Function screen;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: screen,
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 100.0,
        child: SafeArea(
          child: Center(
            child: Text(
              text,
              style: kLargeBottomButton,
            ),
          ),
        ),
      ),
    );
  }
}
