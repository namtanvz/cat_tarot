import 'package:flutter/material.dart';
import 'constants.dart';
import 'screen/welcome/welcome_screen.dart';

void main() => runApp(const MyApp());

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarot card',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.brown,
          primarySwatch: Colors.purple
        ),
        home: const WelcomeScreen());
  }
}


