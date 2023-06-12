import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bmi_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender;
  int height = 180;
  int weight = 60;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCOLA IL TUO BMI'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ReusableCard(
                state: () {
                  setState(() {
                    gender = GenderType.male;
                  });
                },
                color: gender == GenderType.male ? kCardColor : kInactiveColor,
                cardChild: ColumnWidget(
                  icon: FontAwesomeIcons.mars,
                  text: 'MASCHIO',
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                state: () {
                  setState(() {
                    gender = GenderType.female;
                  });
                },
                color:
                    gender == GenderType.female ? kCardColor : kInactiveColor,
                cardChild: ColumnWidget(
                  icon: FontAwesomeIcons.venus,
                  text: 'FEMMINA',
                ),
              ),
            ),
          ],
        )),
        Expanded(
          child: ReusableCard(
            color: kCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ALTEZZA",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      trackHeight: 3.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
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
                color: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PESO',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ETA\'',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        BottomButton(
          screen: () {
            BmiBrain calc = BmiBrain(height: height, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBmi(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
          text: "Calcola",
        ),
      ]),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
