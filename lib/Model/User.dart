import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
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
  int gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
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