import 'dart:math';

class ResultBrain {
  final int weight;
  final int height;
  late double _bmi;
  ResultBrain({required this.weight, required this.height});

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    switch (_bmi) {
      case >= 30.0:
        return 'Obese';
      case < 30.0 && >= 25.0:
        return 'Over Weight';
      case < 25.0 && >= 18.5:
        return 'Normal';
      default:
        return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
