import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team3/Common/data.dart';

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;
  final String authToken;
  final bool isAdmin;

  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.password,
      this.authToken,
      this.isAdmin});

  factory User.fromJson(Map json) {
    return User(
        userId: json['userId'],
        userName: json['username'],
        email: json['email'],
        authToken: json['sessionToken']);
  }

  Map toMap() {
    var map = new Map();
    map["username"] = userName;
    map["password"] = password;

    return map;
  }

  Future login(String url, {Map body}) async {
    return http.post(url, body: body, headers: {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": apiKey,
      "X-Parse-Revocable-Session": '1',
    }).then((http.Response response) {
      final int statusCode = response.statusCode;

      print(response.body.toString());

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return User.fromJson(json.decode(response.body));
    });
  }

  eventConfirm() {}

  eventDeny() {}
}
