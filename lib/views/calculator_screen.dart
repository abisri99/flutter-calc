import 'package:calc/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    print('Button pressed: $label');
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme = Theme.of(context).colorScheme;
    final Color bg = ColorScheme.surface;
    final Color accent = ColorScheme.onSecondary;
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          // Expanded widget to make the container take up remaining space
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // Align widget to position the button grid at the bottom
          Align(
            alignment: Alignment.bottomRight,
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
