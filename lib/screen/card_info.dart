// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class CardInfo extends StatefulWidget {
  const CardInfo ({super.key});

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
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
                child: Text("Card Information",
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





//show detail of card

// [
//   {
//     "name": "The Fool",
//     "number": 0,
//     "arcana": "Major",
//     "suit": "",
//     "img": "assets/images/fool.jpg",
//     "fortune_telling": "Some fortune telling description...",
//     "keywords": "Beginning, Spontaneity, Innocence",
//     "meaning_light": "Some light meaning...",
//     "meaning_shadow": "Some shadow meaning..."
//   },
//   // Add the rest of your Tarot cards here...
// ]



// flutter:
//   assets:
//     - assets/images/
//     - assets/tarot_data.json


// class TarotCard {
//   final String name;
//   final int number;
//   final String arcana;
//   final String suit;
//   final String image;
//   final String fortuneTelling;
//   final String keywords;
//   final String meaningLight;
//   final String meaningShadow;

//   TarotCard({
//     required this.name,
//     required this.number,
//     required this.arcana,
//     required this.suit,
//     required this.image,
//     required this.fortuneTelling,
//     required this.keywords,
//     required this.meaningLight,
//     required this.meaningShadow,
//   });

//   factory TarotCard.fromJson(Map<String, dynamic> json) {
//     return TarotCard(
//       name: json['name'],
//       number: json['number'],
//       arcana: json['arcana'],
//       suit: json['suit'],
//       image: json['img'],
//       fortuneTelling: json['fortune_telling'],
//       keywords: json['keywords'],
//       meaningLight: json['meaning_light'],
//       meaningShadow: json['meaning_shadow'],
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'tarot_card.dart';

// class TarotCardDetails extends StatelessWidget {
//   final TarotCard tarotCard;

//   TarotCardDetails({required this.tarotCard});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(tarotCard.name),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(tarotCard.image),
//             ),
//             SizedBox(height: 16.0),
//             Text('Number: ${tarotCard.number}'),
//             Text('Arcana: ${tarotCard.arcana}'),
//             Text('Suit: ${tarotCard.suit}'),
//             SizedBox(height: 16.0),
//             Text('Fortune Telling:'),
//             Text(tarotCard.fortuneTelling),
//             SizedBox(height: 16.0),
//             Text('Keywords: ${tarotCard.keywords}'),
//             SizedBox(height: 16.0),
//             Text('Meaning in Light:'),
//             Text(tarotCard.meaningLight),
//             SizedBox(height: 16.0),
//             Text('Meaning in Shadow:'),
//             Text(tarotCard.meaningShadow),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'tarot_card.dart';

// class TarotCardDetails extends StatelessWidget {
//   final TarotCard tarotCard;

//   TarotCardDetails({required this.tarotCard});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(tarotCard.name),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(tarotCard.image),
//             ),
//             SizedBox(height: 16.0),
//             Text('Number: ${tarotCard.number}'),
//             Text('Arcana: ${tarotCard.arcana}'),
//             Text('Suit: ${tarotCard.suit}'),
//             SizedBox(height: 16.0),
//             Text('Fortune Telling:'),
//             Text(tarotCard.fortuneTelling),
//             SizedBox(height: 16.0),
//             Text('Keywords: ${tarotCard.keywords}'),
//             SizedBox(height: 16.0),
//             Text('Meaning in Light:'),
//             Text(tarotCard.meaningLight),
//             SizedBox(height: 16.0),
//             Text('Meaning in Shadow:'),
//             Text(tarotCard.meaningShadow),
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

