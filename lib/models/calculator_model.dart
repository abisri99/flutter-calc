class CalculatorModel {
  List<String> tokenizeInput(String input) {
    return input.split(RegExp(r'(\s+|(?=[-+*/])|(?<=[-+*/]))')).where((e) => e.trim().isNotEmpty).toList();
  }

  bool isOperand(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool isOperator(String s) {
    List<String> operators = ["+", "-", "*", "/"];
    return operators.contains(s);
  }

  int getPrecedence(String operator) {
    if (operator == '+' || operator == '-') {
      return 1;
    } else if (operator == '*' || operator == '/') {
      return 2;
    }
    return 0;
  }

  double performOperation(double operand1, double operand2, String operator) {
    switch (operator) {
      case '+':
        return operand1 + operand2;
      case '-':
        return operand1 - operand2;
      case '*':
        return operand1 * operand2;
      case '/':
        if (operand2 == 0) {
          throw ArgumentError('Division by zero is not allowed.');
        }
        return operand1 / operand2;
      default:
        throw ArgumentError('Unsupported operator: $operator');
    }
  }

  double evaluateExpression(String input) {
    List<String> tokens = tokenizeInput(input);
    List<double> values = [];
    List<String> operators = [];

    for (String token in tokens) {
      if (isOperand(token)) {
        values.add(double.parse(token));
      } else if (isOperator(token)) {
        while (operators.isNotEmpty && getPrecedence(operators.last) >= getPrecedence(token)) {
          double operand2 = values.removeLast();
          double operand1 = values.removeLast();
          String operator = operators.removeLast();
          double result = performOperation(operand1, operand2, operator);
          values.add(result);
        }
        operators.add(token);
      } else {
        throw Exception('Invalid token: $token');
      }
    }

    while (operators.isNotEmpty) {
      double operand2 = values.removeLast();
      double operand1 = values.removeLast();
      String operator = operators.removeLast();
      double result = performOperation(operand1, operand2, operator);
      values.add(result);
    }

    return values.last;
  }
}

// void main() {
//   CalculatorModel calculator = CalculatorModel();
//   String expression = "3 + 5 * 2 - 8 / 4";
//   double result = calculator.evaluateExpression(expression);
//   print('Result: $result'); 
// }
