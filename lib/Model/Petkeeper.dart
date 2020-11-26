import 'dart:convert';

List<Petkeeper> petkeeperFromJson(String str) => List<Petkeeper>.from(json.decode(str).map((x) => Petkeeper.fromJson(x)));

String petkeeperToJson(List<Petkeeper> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Petkeeper {
  Petkeeper({
    this.id,
    this.firstName,
    this.lastname,
    this.password,
    this.email,
    this.picture,
    this.birthday,
    this.gender,
  });

  int id;
  String firstName;
  String lastname;
  String password;
  String email;
  String picture;
  DateTime birthday;
  String gender;

  factory Petkeeper.fromJson(Map<String, dynamic> json) => Petkeeper(
    id: json["id"],
    firstName: json["firstName"],
    lastname: json["lastname"],
    password: json["password"],
    email: json["email"],
    picture: json["picture"],
    birthday: DateTime.parse(json["birthday"]),
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastname": lastname,
    "password": password,
    "email": email,
    "picture": picture,
    "birthday": birthday.toIso8601String(),
    "gender": gender,
  };
}