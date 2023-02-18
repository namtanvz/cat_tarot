import 'package:flutter/material.dart';
import 'package:tarot/constants.dart';
import 'package:tarot/screen/welcome/components/background.dart';

class Login extends StatelessWidget {
  const Login ({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}