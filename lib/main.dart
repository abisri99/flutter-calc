import "package:calc/views/calculator_screen.dart";
import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDyamic, darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightDyamic ?? ColorScheme.light(),
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic ?? ColorScheme.dark(),
          ),
          home: Home(),
        );
      },
    );
  }
}
