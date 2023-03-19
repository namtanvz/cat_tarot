// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tarot/common/theme.dart';
import 'package:tarot/constants.dart';
import 'package:tarot/screen/welcome/components/background.dart';

import '../../login.dart';
import '../../signup.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/logo.png',
          height: size.height * 0.5,
        ),
        const Text(
          "\nBelieve in magic",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        Container(
          decoration: ThemeHelper().buttonBoxDecoration(context),
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: const Text('LOG IN')),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  backgroundColor: kPrimaryLightColor,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text('SIGN UP')),
          ),
        )
      ],
    ));
  }
}
