import 'dart:convert';

import 'package:TS_AppsMovil/Model/Client.dart';
import 'package:TS_AppsMovil/Model/Petkeeper.dart';

List<Service> serviceFromJson(String str) => List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
    Service({
        this.id,
        this.name,
        this.description,
        this.location,
        this.startTime,
        this.duration,
        this.client,
        this.petKeeper,
    });

    int id;
    String name;
    String description;
    String location;
    DateTime startTime;
    int duration;
    Client client;
    Petkeeper petKeeper;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        startTime: DateTime.parse(json["startTime"]),
        duration: json["duration"],
        client: Client.fromJson(json["client"]),
        petKeeper: Petkeeper.fromJson(json["petKeeper"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "startTime": startTime.toIso8601String(),
        "duration": duration,
        "client": client.toJson(),
        "petKeeper": petKeeper.toJson(),
    };
}
