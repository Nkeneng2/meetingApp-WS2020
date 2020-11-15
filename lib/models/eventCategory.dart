import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:team3/Common/data.dart';

class EventCategory {
  final String objectId;
  final String name;
  final String color;

  EventCategory({this.objectId, this.name, this.color});

  factory EventCategory.fromJson(Map json) {
    return EventCategory(
      objectId: json['objectId'],
      name: json['name'],
      color: json['color'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["objectId"] = objectId;
    map["name"] = name;
    map["color"] = color;
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
      return EventCategory.fromJson(json.decode(response.body));
    });
  }

  eventConfirm() {}

  eventDeny() {}
}
