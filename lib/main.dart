import 'package:flutter/material.dart';
import 'package:formulistic/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        theme: ThemeData(
          fontFamily: 'InriaSans',
          colorScheme: const ColorScheme.dark(
              primary: Colors.white,
              background: Colors.black,
              secondary: Color.fromRGBO(254, 114, 16, 1.0),
              secondaryContainer: Color.fromRGBO(245, 214, 214, 1.0),
              onSecondaryContainer: Color.fromRGBO(30, 22, 52, 1.0)),
        ));
  }
}
