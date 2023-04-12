// ignore_for_file: non_constant_identifier_names

class TarotCard {
  String? name;
  String? number;
  String? arcana;
  String? suit;
  String? img;
  String? fortune_telling;
  String? keywords;
  String? meanings;

  TarotCard({
    this.name,
    this.number,
    this.arcana,
    this.suit,
    this.img,
    this.fortune_telling,
    this.keywords,
    this.meanings,
  });

  factory TarotCard.fromJson(Map<String, dynamic> json) {
    return TarotCard(
      name: json['name'],
      number: json['number'],
      arcana: json['arcana'],
      suit: json['suit'],
      img: json['img'],
      fortune_telling: json['fortune_telling'],
      keywords: json['keywords'],
      meanings: json['meanings']
    );
  }
}
