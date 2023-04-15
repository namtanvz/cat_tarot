// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:tarot/screen/card_info.dart';
import 'package:tarot/screen/setting.dart';
import '../constants.dart';
import 'homepage.dart';
import 'user_info.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final items = const [
    Icon(
      Icons.home,
      size: 30,
      color: kPrimaryLightColor,
    ),
    Icon(
      Icons.card_giftcard,
      size: 30,
      color: kPrimaryLightColor,
    ),
    // Icon(
    //   Icons.person,
    //   size: 30,
    //   color: kPrimaryLightColor,
    // ),
    Icon(
      Icons.settings,
      size: 30,
      color: kPrimaryLightColor,
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        color: kPrimaryColor,
      ),
      body: Container(
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Homepage();
        break;
      case 1:
        widget = const CardInfo();
        break;
      // case 2:
      //   widget = const UserInfo();
      //   break;
      case 2:
        widget = const Setting();
        break;
      default:
        widget = const Homepage();
        break;
    }
    return widget;
  }
}
