import 'package:calc/models/calculator_model.dart';

class CalculatorController {
  final CalculatorModel _calculatorModel = CalculatorModel();

  String currentExpression = '0';

  void onButtonPressed(String label) {
    if (label == 'C') {
      if (currentExpression.length == 1 || label.isEmpty){
        currentExpression = '0';
      }
      else if (currentExpression.isNotEmpty) {
       currentExpression = currentExpression.substring(0, currentExpression.length -1);
      }
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
