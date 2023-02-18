import 'package:flutter/material.dart';
import 'constants.dart';
import 'screen/welcome/welcome_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarot card',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.brown,
      ),
      home: WelcomeScreen()
    );
  }
}
