import 'dart:convert';

List<Client> clientFromJson(String str) => List<Client>.from(json.decode(str).map((x) => Client.fromJson(x)));

String clientToJson(List<Client> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Client {
  Client({
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

  factory Client.fromJson(Map<String, dynamic> json) => Client(
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
