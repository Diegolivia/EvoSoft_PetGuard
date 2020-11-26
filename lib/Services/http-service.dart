
import 'package:TS_AppsMovil/Model/Company.dart';
import 'package:TS_AppsMovil/Model/Payment.dart';

import 'package:TS_AppsMovil/Model/Pet.dart';
import 'package:TS_AppsMovil/Model/Petkeeper.dart';

import 'package:TS_AppsMovil/Model/Service.dart';
import 'package:TS_AppsMovil/Model/User.dart';



import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = "https://petguard20201124160131.azurewebsites.net/";


  Map<String, String> headers = {"Content-type": "application/json"};

  Future<void> deleteUser(int id) async {
    var res = await http.delete("$apiUrl/$id");

    if (res.statusCode == 200) {
      print("Deleted");
    }
  }



  Future<User> getUser(int id) async {
    var res = await http.get("api/users/$id");

    if (res.statusCode == 200) {
      print(res.body);
      return User.fromJson(json.decode(res.body));
    } else {
      throw 'cant get users';
    }
  }




  Future<List<Petkeeper>> getKeppers() async {
    try {
      final response =
          await http.get("$apiUrl" + "api/PetKeeper", headers: this.headers);
      if (response.statusCode == 200) {
        String responseBody = response.body;
        debugPrint("getKeepers : " + responseBody);
        final List<Petkeeper> drivers = petkeeperFromJson(response.body);

        return drivers;
      }
      return null;
    } catch (e) {


      return List<Petkeeper>();
    }
  }



  Future<List<Service>> getServices() async { //Cargo
    try {
      final response =
      await http.get("$apiUrl" + "api/Service", headers: this.headers);
      if (response.statusCode == 200) {
        String responseBody = response.body;
        debugPrint("getCategories : " + responseBody);
        final List<Service> categories = serviceFromJson(response.body);

        return categories;
      }
      return null;
    } catch (e) {


      return List<Service>();
    }
  }


  Future<List<Payment>> getPayments() async { //Fav
    try {
      final response =
      await http.get("$apiUrl" + "api/Payment", headers: this.headers);
      if (response.statusCode == 200) {
        String responseBody = response.body;
        debugPrint("getCompanies : " + responseBody);
        final List<Payment> payments = paymentFromJson(response.body);

        return payments;
      }
      return null;
    } catch (e) {


      return List<Payment>();
    }
  }








  Future<Pet> deletePet(String id) async {
    final http.Response response = await http.delete(
        apiUrl + "api/Pet/" + "$id",
        headers: this.headers
    );
    debugPrint("responseBody : " + response.body);

    if (response.statusCode == 200) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete');
    }
  }




  Future<Pet> createPet( String na, int idc, int br) async {
    final http.Response response = await http.post(
      apiUrl + "api/Pet",
      headers: this.headers,

      body: jsonEncode(

          {
            "name": na,
            "clientId": idc,
            "breed": br
          }),
    );


    if (response.statusCode == 201) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {


      }
  }


  Future<Pet> putPet(String id, String na, int idc, int br) async {
    final http.Response response = await http.put(
      apiUrl + "api/Pet/" + "$id",
      headers: this.headers,

      body: jsonEncode(

          {
            "name": na,
            "clientId": idc,
            "breed": br
          }),
    );



    if (response.statusCode == 200) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update');

    }
  }


  Future<List<Pet>> getPets() async {
    try {
      final response =
      await http.get("$apiUrl" + "api/Pet", headers: this.headers);
      if (response.statusCode == 200) {
        String responseBody = response.body;
        debugPrint("getPets : " + responseBody);
        final List<Pet> pets = petFromJson(response.body);

        return pets;
      }
      return null;
    } catch (e) {


      return List<Pet>();
    }
  }
}










