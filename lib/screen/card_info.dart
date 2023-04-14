// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, unused_element, avoid_returning_null_for_void, avoid_unnecessary_containers, avoid_print, unused_import, dead_code

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'package:tarot/screen/details_page.dart';

import '../constants.dart';
import '../data/tarot_json.dart';
import 'model/global_card.dart';

class CardInfo extends StatefulWidget {
  const CardInfo({super.key});

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();

  DateFormat format = DateFormat('dd/MM');
  List<bool> flips = [false, false, false, false];
  List tarots = [];
  List unlockCard = [];

  @override
  void initState() {
    super.initState();
    tarots.addAll(tarotData);
    unlockCard.addAll(tarotData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackground,
        automaticallyImplyLeading: false,
        elevation: .0,
        centerTitle: true,
        title: Text(
          'Today is ${format.format(DateTime.now())}',
          style: TextStyle(
            fontSize: width / 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 4),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTarotCard(cardKey1, 0, 'Overview'.trArgs()),
                    SizedBox(width: 16),
                    _buildTarotCard(cardKey2, 1, 'Work'.trArgs()),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTarotCard(cardKey3, 2, 'Love'.trArgs()),
                    SizedBox(width: 16),
                    _buildTarotCard(cardKey4, 3, 'Finance'.trArgs()),
                  ],
                ),
                SizedBox(height: 16),
                flips.contains(false)
                    ? Container()
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 48.0),
                        child: ElevatedButton(
                            onPressed: () {
                              global_Results = unlockCard.sublist(0, 4);
                              print(global_Results[0]['name']);
                              print(global_Results[1]['name']);
                              print(global_Results[2]['name']);
                              print(global_Results[3]['name']);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Result',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width / 24,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTarotCard(key, number, title) {
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
              height: height * .32,
              width: width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kGradient,
              ),
              child: Lottie.asset('assets/lottie/lottie_card.json'),
            ),
          ),
          back: GestureDetector(
            onTap: () => null,
            child: Container(
              height: height * .32,
              width: width * .4,
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
        SizedBox(height: 12),
        Text(
          flips[number] == true ? unlockCard[number]['name'] : title,
          style: TextStyle(
              fontSize: width / 24,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              wordSpacing: 1.5,
              color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

// class TarotCard {
//   final String name;
//   final String image;

//   TarotCard({required this.name, required this.image});
// }

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'tarot_card.dart';

// void main() {
//   runApp(TarotApp());
// }

// class TarotApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TarotPage(),
//     );
//   }
// }

// class TarotPage extends StatefulWidget {
//   @override
//   _TarotPageState createState() => _TarotPageState();
// }

// class _TarotPageState extends State<TarotPage> {
//   List<TarotCard> tarotDeck = [
//     TarotCard(name: 'The Fool', image: 'assets/images/fool.jpg'),
//     // Add the rest of your Tarot cards here...
//   ];

//   List<TarotCard> selectedCards = [];

//   void _drawCards() {
//     selectedCards.clear();
//     var random = Random();

//     for (int i = 0; i < 4; i++) {
//       int index = random.nextInt(tarotDeck.length);
//       selectedCards.add(tarotDeck[index]);
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tarot Cards'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: GridView.builder(
//                 itemCount: selectedCards.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.66,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(selectedCards[index].image),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             selectedCards[index].name,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _drawCards,
//               child: Text('Draw Cards'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//shake phone to random

// dependencies:
//   flutter:
//     sdk: flutter
//   sensors: ^2.0.0

// import 'package:sensors/sensors.dart';
// // Other imports...

// class _TarotPageState extends State<TarotPage> {
//   // Existing properties...

//   // Properties to handle shake detection
//   AccelerometerEvent? _lastAccelerometerEvent;
//   DateTime? _lastShakeTime;

//   @override
//   void initState() {
//     super.initState();
//     _loadTarotData();
//     _listenToAccelerometer();
//   }

//   // Existing methods...

//   void _listenToAccelerometer() {
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       if (_lastAccelerometerEvent != null) {
//         final double deltaX = event.x - _lastAccelerometerEvent!.x;
//         final double deltaY = event.y - _lastAccelerometerEvent!.y;
//         final double deltaZ = event.z - _lastAccelerometerEvent!.z;

//         final double speed = (deltaX * deltaX) + (deltaY * deltaY) + (deltaZ * deltaZ);

//         if (speed > 3000) {
//           final DateTime now = DateTime.now();
//           if (_lastShakeTime == null || now.difference(_lastShakeTime!) > Duration(seconds: 1)) {
//             _lastShakeTime = now;
//             _drawCards();
//           }
//         }
//       }
//       _lastAccelerometerEvent = event;
//     });
//   }
// }
