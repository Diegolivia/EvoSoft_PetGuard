import 'dart:convert';

List<Payment> paymentFromJson(String str) => List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

String paymentToJson(List<Payment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payment {
  Payment({
    this.id,
    this.clientId,
    this.cardId,
    this.paymentDetail,
    this.date,
    this.totalAmmount,
  });

  int id;
  int clientId;
  int cardId;
  String paymentDetail;
  DateTime date;
  int totalAmmount;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    clientId: json["clientId"],
    cardId: json["cardId"],
    paymentDetail: json["paymentDetail"],
    date: DateTime.parse(json["date"]),
    totalAmmount: json["totalAmmount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "clientId": clientId,
    "cardId": cardId,
    "paymentDetail": paymentDetail,
    "date": date.toIso8601String(),
    "totalAmmount": totalAmmount,
  };
}
