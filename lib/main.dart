import 'package:flutter/material.dart';
import 'package:p5/screens/splash_screen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
      seedColor: const Color.fromARGB(233, 158, 83, 46)),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: SplashScreen(),
    );
  }
}
