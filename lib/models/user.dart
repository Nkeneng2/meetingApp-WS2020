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
        userId: json['objectId'],
        userName: json['username'],
        email: json['email'],
        authToken: json['sessionToken']);
  }

  Map toMap() {
    var map = new Map();
    map["username"] = userName;
    map["password"] = password;
    // ignore: unnecessary_statements
    email != null ? map["email"] = email : null;
    return map;
  }

  Future postData(String url, {Map body}) async {
    return http.post(url, body: body, headers: {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": apiKey,
      "X-Parse-Revocable-Session": '1',
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      final responseText = json.decode(response.body);

      //TODO only for debug purposes
      print(response.body.toString());

      if (statusCode != 201 && statusCode != 200 || json == null) {
        throw (responseText['error'].toString());
      }
      return User.fromJson(json.decode(response.body));
    }).catchError((error) {
      error.message = jsonDecode(error.toString())["message"];
      print(error.message);
      throw ('something went wrong');
    });
  }

  static Future getCurrentUser(String token) async {
    return http.get('https://parseapi.back4app.com/users/me', headers: {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": apiKey,
      "X-Parse-Session-Token": token,
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      final responseText = json.decode(response.body);

      //TODO only for debug purposes
      print(response.body.toString());

      if (statusCode != 200 || json == null) {
        throw (responseText['error'].toString());
      }
      return User.fromJson(json.decode(response.body));
    }).catchError((error) {
      error.message = jsonDecode(error.toString())["message"];
      print(error.message);
      throw ('something went wrong');
    });
  }

  Future getUser(String url) async {
    return http.get(url, headers: {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": apiKey,
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      final responseText = json.decode(response.body);

      //TODO only for debug purposes
      print(response.body.toString());

      if (statusCode != 200 || json == null) {
        throw (responseText['error'].toString());
      }
      return User.fromJson(json.decode(response.body));
    }).catchError((error) {
      error.message = jsonDecode(error.toString())["message"];
      print(error.message);
      throw ('something went wrong');
    });
  }

  eventConfirm() {}

  eventDeny() {}
}
