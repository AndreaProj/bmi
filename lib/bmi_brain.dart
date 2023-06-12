import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBmi() {
    double bmi = weight / pow(height / 100, 2);
    _bmi = bmi;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Sovrappeso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else
      return 'Sottopeso';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Devi fare palestra bro';
    } else if (_bmi > 18.5) {
      return 'You are great!';
    } else
      return 'Non scomparire';
  }
}
