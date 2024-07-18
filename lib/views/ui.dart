import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color bg = Color(0xff1a1a1a);
  Color accent = Color(0xff323232);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 200,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '0', // Placeholder for display
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 4),
                itemCount: buttonLabels.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: accent),
                      onPressed: null,
                      child: Text(
                        buttonLabels[index],
                        style: TextStyle(color: Colors.white),
                      ));
                }),
          ),
        ],
      ),
    );
  }

  // Method to handle button press (implement your logic here)
  void onButtonPressed(String label) {
    // Placeholder: Print the button label for demonstration
    print('Button pressed: $label');
  }
}
