// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
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
                child: Text("User Information",
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