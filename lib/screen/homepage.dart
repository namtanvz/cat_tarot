// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors, unused_import, body_might_complete_normally_nullable, avoid_print, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shake/shake.dart';
import 'package:tarot/screen/navbar.dart';

import '../constants.dart';
import '../data/tarot_json.dart';
import 'card_home_details.dart';
import 'model/home_card.dart';
import 'model/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _headerHeight = 100.0;
  Profile profile = Profile();
  List tarots = [];
  List unlockCard = [];
  List<bool> flips = [false];
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  late ShakeDetector detector;
  bool cardGenerated = false;
  DateFormat format = DateFormat('dd/MM/yyyy');

  Future<Profile?> readUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return Profile.fromJson(snapshot.data()!);
    }
  }

  @override
  void initState() {
    super.initState;
    tarots.addAll(tarotData);
    unlockCard.addAll(tarotData);
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      if (!cardGenerated) {
        setState(() {
          cardGenerated = true;
        });
      }
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<Profile?>(
            future: readUser(),
            builder: (context, snapshot) {
              final user = snapshot.data!;
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                profile.email = user.email;
                profile.fullname = user.fullname;
                profile.password = user.password;
                profile.birthday = user.birthday;
                print(
                    'email : ${profile.email}\n fullname : ${profile.fullname}\n password : ${profile.password}\n birthday : ${profile.birthday}');
                var size = MediaQuery.of(context).size;
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: _headerHeight,
                        ),
                        SafeArea(
                          child: Container(
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Visibility(
                                      visible: !cardGenerated,
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                        height: size.height * 0.45,
                                      ),
                                    ),
                                    Visibility(
                                      visible: cardGenerated,
                                      child: _buildTarotCard(cardKey, 0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 64,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Welcome ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                      )),
                                  TextSpan(
                                      text: '${profile.fullname}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                          decoration: TextDecoration.underline,
                                          decorationColor: kGradient,
                                          decorationThickness: 4.0))
                                ])),
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                    'Today is ${format.format(DateTime.now())}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontStyle: FontStyle.italic,
                                      letterSpacing: 0.5,
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );

  Widget _buildTarotCard(key, number) {
    return Column(
      children: [
        FlipCard(
          key: key,
          flipOnTouch: false,
          front: GestureDetector(
            onTap: () {
              tarots.shuffle();
              key.currentState.toggleCard();
              setState(() {
                flips[number] = true;
              });
              unlockCard[number] = tarots[0];

              // print(unlockCard[number]);
              tarots.removeAt(0);
            },
            child: Container(
              height: height * .42,
              width: width * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kGradient,
              ),
              child: Lottie.asset('assets/lottie/lottie_card.json'),
            ),
          ),
          back: GestureDetector(
            onTap: () {
              home_Results = unlockCard.sublist(0);
              print(home_Results[0]['name']);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homeDetailPage()));
            },
            child: Container(
              height: height * .42,
              width: width * .5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kGradient,
                  image: DecorationImage(
                    image: AssetImage(unlockCard.length < number + 1
                        ? 'images/${tarots[number]['img']}'
                        : 'images/${unlockCard[number]['img']}'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
