// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_import, unused_import

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:tarot/common/theme.dart';
import 'package:tarot/screen/user_info.dart';
import 'package:tarot/screen/welcome/welcome_screen.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _headerHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
            ),
            SafeArea(
                child: Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: 24),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(32),
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: TextButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Edit Profile',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInfo()));
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(32),
                    // decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          auth.FirebaseAuth.instance.signOut().then((value) => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomeScreen()))
                              });
                        },
                        child: Text('Log out',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
