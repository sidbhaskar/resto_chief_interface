import 'package:flutter/material.dart';
import 'package:resto_chief_interface/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chief Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
        primaryColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(255, 118, 34, 1),
          selectionColor: Color.fromRGBO(255, 186, 143, 1),
          selectionHandleColor: Color.fromRGBO(255, 118, 34, 1),
        ),
      ),
      home: const Dashboard(),
    );
  }
}
