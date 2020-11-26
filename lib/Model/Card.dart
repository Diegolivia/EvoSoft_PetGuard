import 'dart:convert';

Card cardFromJson(String str) => Card.fromJson(json.decode(str));

String cardToJson(Card data) => json.encode(data.toJson());

class Card {
  Card({
    this.id,
    this.cardName,
    this.cardNumber,
    this.expDate,
  });

  int id;
  String cardName;
  int cardNumber;
  DateTime expDate;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    id: json["id"],
    cardName: json["cardName"],
    cardNumber: json["cardNumber"],
    expDate: DateTime.parse(json["expDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardName": cardName,
    "cardNumber": cardNumber,
    "expDate": expDate.toIso8601String(),
  };
}
