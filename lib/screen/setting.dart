// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting ({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting > {
  final _headerHeight = 130.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: Center(
                child: Text("Setting",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}