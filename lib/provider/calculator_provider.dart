import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider with ChangeNotifier {
  String _displayText = '';

  String get displayText => _displayText;

  void updateDisplay(String newDisplay) {
    _displayText = newDisplay;
    notifyListeners();
  }

  void clearDisplay() {
    _displayText = '';
    notifyListeners();
  }

  void evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_displayText
          .replaceAll('x', '*')
          .replaceAll('/', '/')); // Handle custom symbols like 'x'
      ContextModel cm = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);
      _displayText = evalResult.toString();
    } catch (e) {
      _displayText = 'Error';
    }
    notifyListeners();
  }
}
