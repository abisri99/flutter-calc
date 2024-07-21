import 'package:calc/models/calculator_model.dart';

class CalculatorController {
  final CalculatorModel _calculatorModel = CalculatorModel();

  String currentExpression = '0';

  void onButtonPressed(String label) {
    if (label == 'C') {
      currentExpression = '0';
    } else if (label == '=') {
      try {
        currentExpression =
            _calculatorModel.evaluateExpression(currentExpression).toString();
      } catch (e) {
        currentExpression = 'Error';
      }
    } else {
      if (currentExpression == '0') {
        currentExpression = label;
      } else {
        currentExpression += label;
      }
    }
  }
}
