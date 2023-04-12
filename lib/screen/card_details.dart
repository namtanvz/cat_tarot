// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:tarot/screen/model/tarot_card.dart';


// class TarotCardDetails extends StatelessWidget {
//   final TarotCard tarotCard;

//   const TarotCardDetails({super.key, required this.tarotCard});

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
//               child: Image.asset(tarotCard.img),
//             ),
//             SizedBox(height: 16.0),
//             Text('Number: ${tarotCard.number}'),
//             Text('Arcana: ${tarotCard.arcana}'),
//             Text('Suit: ${tarotCard.suit}'),
//             SizedBox(height: 16.0),
//             Text('Fortune Telling:'),
//             Text(tarotCard.fortune_telling),
//             SizedBox(height: 16.0),
//             Text('Keywords: ${tarotCard.keywords}'),
//             SizedBox(height: 16.0),
//             Text('Meaning in Light:'),
//             Text(tarotCard.meanings),
//             SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TarotDetailScreen extends StatelessWidget {
  final Map<String, dynamic> cardData;

  const TarotDetailScreen({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData['name']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('images/${cardData['img']}'),
            SizedBox(height: 16.0),
            Text(
              cardData['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              cardData['fortune_telling'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
