
import 'dart:convert';

List<Message> messageFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  Message({
    this.id,
    this.text,
    this.file,
    this.transmitterId,
    this.reciberId,
    this.chatId,
  });

  int id;
  String text;
  int file;
  int transmitterId;
  int reciberId;
  int chatId;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    text: json["text"],
    file: json["file"],
    transmitterId: json["transmitterId"],
    reciberId: json["reciberId"],
    chatId: json["chatId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "file": file,
    "transmitterId": transmitterId,
    "reciberId": reciberId,
    "chatId": chatId,
  };
}
