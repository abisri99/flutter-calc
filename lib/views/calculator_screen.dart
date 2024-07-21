import 'package:calc/widgets/custom_button.dart';
import 'package:calc/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color bg = Color(0xff1a1a1a);
  Color accent = Color(0xff323232);
  final CalculatorController _calculatorController = CalculatorController();

  // List of button labels for the calculator
  List<String> buttonLabels = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '=',
    '+',
  ];

  void onButtonPressed(String label) {
    setState(() {
      _calculatorController.onButtonPressed(label);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          // Expanded widget to make the container take up remaining space
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _calculatorController.currentExpression,
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // Align widget to position the button grid at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: buttonLabels.length,
                itemBuilder: (context, index) {
                  return CustomButton(
                    label: buttonLabels[index],
                    color: accent,
                    onPressed: () => onButtonPressed(buttonLabels[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
