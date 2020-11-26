import 'dart:convert';

List<Pet> petFromJson(String str) => List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String petToJson(List<Pet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  Pet({
    this.id,
    this.name,
    this.breed,
    this.clientId,
  });

  int id;
  String name;
  String breed;
  int clientId;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json["id"],
    name: json["name"],
    breed: json["breed"],
    clientId: json["clientId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "breed": breed,
    "clientId": clientId,
  };
}
